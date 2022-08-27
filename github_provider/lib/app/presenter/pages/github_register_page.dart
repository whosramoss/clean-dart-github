import 'package:flutter/material.dart';
import 'package:github_commons/main.dart';
import 'package:provider/provider.dart';

import '../provider/github_provider.dart';

class GithubRegisterPage extends StatefulWidget {
  const GithubRegisterPage({Key? key}) : super(key: key);

  @override
  State<GithubRegisterPage> createState() => _GithubRegisterPageState();
}

class _GithubRegisterPageState extends State<GithubRegisterPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer<GithubProvider>(
        builder: (context, provider, child) {
          return GithubRegisterBodyWidget(
            textUsername: provider.username,
            textError: provider.error?.errorMessage,
            isLoading: provider.isLoading,
            controller: _controller,
            action: () {
              provider.setGithubData().then((value) {
                if (!provider.hasError) openProfile();
              });
            },
            changeText: provider.setUsername,
          );
        },
      ),
    );
  }

  void openProfile() {
    Navigator.of(context).pushNamed(GithubRoutes.profile);
  }
}
