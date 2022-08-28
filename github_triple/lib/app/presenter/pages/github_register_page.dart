import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:github_commons/main.dart';

import '../../domain/github_result_entity.dart';
import '../stores/github_triple_store.dart';

class GithubRegisterPage extends StatefulWidget {
  const GithubRegisterPage({Key? key}) : super(key: key);

  @override
  State<GithubRegisterPage> createState() => _GithubRegisterPageState();
}

class _GithubRegisterPageState extends State<GithubRegisterPage> {
  final _store = Modular.get<GithubTripleStore>();

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: TripleBuilder<GithubTripleStore, GithubError, GithubResultEntity>(
        store: _store,
        builder: (context, Triple<GithubError, GithubResultEntity> triple) {
          return GithubRegisterBodyWidget(
            controller: _controller,
            isLoading: triple.isLoading,
            textError: triple.error?.errorMessage,
            textUsername: triple.state.username,
            action: _store.setGithubData,
            changeText: _store.setUsername,
          );
        },
      ),
    );
  }
}
