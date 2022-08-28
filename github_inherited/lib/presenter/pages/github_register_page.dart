import 'package:flutter/material.dart';
import 'package:github_commons/main.dart';
import 'package:github_inherited/presenter/pages/github_profile_page.dart';

import '../inherited/github_inherited_widget.dart';

class GithubRegisterPage extends StatefulWidget {
  const GithubRegisterPage({Key? key}) : super(key: key);

  @override
  State<GithubRegisterPage> createState() => GithubRegisterPageState();
}

class GithubRegisterPageState extends State<GithubRegisterPage> {
  var textController = TextEditingController();

  var textUsername = '';
  void setUsername(String value) => setState(() => textUsername = value);

  var isLoading = false;
  void setLoading(bool value) => setState(() => isLoading = value);

  var textError = '';
  void setErrorMessage(String value) => setState(() => textError = value);

  Future<void> setGithubData() async {
    try {
      final action = GithubInheritedWidget.of(context)!.action;

      setErrorMessage('');
      setLoading(true);

      final profile = await action.getProfile(textUsername);
      final lstRepositories = await action.getRepositories(textUsername);
      final lstLanguages = action.getLanguages(lstRepositories);

      final value = GithubResultEntity(
        username: textUsername,
        profile: profile,
        lstRepositories: lstRepositories,
        lstLanguages: lstLanguages,
      );

      openProfilePage(value);
    } on GithubError catch (error) {
      debugPrint(error.toString());
      setErrorMessage(error.errorMessage);
    } finally {
      setLoading(false);
    }
  }

  void openProfilePage(GithubResultEntity value) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GithubProfilePage(result: value)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GithubRegisterBodyWidget(
        controller: textController,
        isLoading: isLoading,
        textError: textError,
        textUsername: textUsername,
        action: setGithubData,
        changeText: setUsername,
      ),
    );
  }
}
