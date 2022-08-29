import 'package:flutter/material.dart';
import 'package:github_commons/main.dart';

import '../provider/github_provider.dart';

import 'package:provider/provider.dart';

class GithubProfilePage extends StatefulWidget {
  const GithubProfilePage({Key? key}) : super(key: key);

  @override
  State<GithubProfilePage> createState() => _GithubProfilePageState();
}

class _GithubProfilePageState extends State<GithubProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const GithubAppBarWidget(),
      body: Consumer<GithubProvider>(
        builder: (context, provider, child) {
          return GithubProfileBodyWidget(
            openRepository: (value) => provider.openUrl(value),
            profile: provider.profile,
            lstLanguages: provider.lstLanguages,
            lstRepositories: provider.lstRepositories,
          );
        },
      ),
    );
  }
}
