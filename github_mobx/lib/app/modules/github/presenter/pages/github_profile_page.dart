import 'package:flutter/material.dart';
import 'package:github_commons/main.dart';

import '../stores/github_store.dart';

class GithubProfilePage extends StatefulWidget {
  const GithubProfilePage({Key? key}) : super(key: key);

  @override
  State<GithubProfilePage> createState() => _GithubProfilePageState();
}

class _GithubProfilePageState extends State<GithubProfilePage> {
  final _store = Modular.get<GithubStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const GithubAppBarWidget(),
      body: Observer(builder: (_) {
        return GithubProfileBodyWidget(
          openRepository: (value) => _store.openUrl(value),
          profile: _store.profile,
          lstLanguages: _store.lstLanguages,
          lstRepositories: _store.lstRepositories,
        );
      }),
    );
  }
}
