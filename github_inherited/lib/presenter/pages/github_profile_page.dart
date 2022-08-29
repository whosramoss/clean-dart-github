import 'package:flutter/material.dart';
import 'package:github_commons/main.dart';

import '../inherited/github_inherited_widget.dart';

class GithubProfilePage extends StatefulWidget {
  final GithubResultEntity result;
  const GithubProfilePage({Key? key, required this.result}) : super(key: key);

  @override
  State<GithubProfilePage> createState() => _GithubProfilePageState();
}

class _GithubProfilePageState extends State<GithubProfilePage> {
  @override
  Widget build(BuildContext context) {
    var action = GithubInheritedWidget.of(context)!.action;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const GithubAppBarWidget(),
      body: GithubProfileBodyWidget(
        openRepository: (value) {
          action.openRepostory(value);
        },
        profile: widget.result.profile,
        lstLanguages: widget.result.lstLanguages,
        lstRepositories: widget.result.lstRepositories,
      ),
    );
  }
}
