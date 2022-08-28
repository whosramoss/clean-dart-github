import 'package:flutter/material.dart';

import 'package:github_commons/main.dart';

import 'package:flutter_triple/flutter_triple.dart';

import '../stores/github_triple_store.dart';

class GithubProfilePage extends StatefulWidget {
  const GithubProfilePage({Key? key}) : super(key: key);

  @override
  State<GithubProfilePage> createState() => _GithubProfilePageState();
}

class _GithubProfilePageState extends State<GithubProfilePage> {
  final _store = Modular.get<GithubTripleStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const GithubAppBarWidget(),
      body: TripleBuilder<GithubTripleStore, GithubError, GithubResultEntity>(
        store: _store,
        builder: (context, Triple<GithubError, GithubResultEntity> triple) {
          return GithubProfileBodyWidget(
            openRepository: (value) => _store.openUrl(value),
            profile: triple.state.profile,
            lstLanguages: triple.state.lstLanguages,
            lstRepositories: triple.state.lstRepositories,
          );
        },
      ),
    );
  }
}
