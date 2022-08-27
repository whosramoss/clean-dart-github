import 'package:flutter/material.dart';
import 'package:github_commons/main.dart';
import '../stores/github_store.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

class GithubRegisterPage extends StatefulWidget {
  const GithubRegisterPage({Key? key}) : super(key: key);

  @override
  State<GithubRegisterPage> createState() => _GithubRegisterPageState();
}

class _GithubRegisterPageState extends State<GithubRegisterPage> {
  final _store = Modular.get<GithubStore>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Observer(builder: (_) {
        return GithubRegisterBodyWidget(
          textUsername: _store.username,
          textError: _store.error?.errorMessage,
          isLoading: _store.isLoading,
          controller: _controller,
          action: _store.setGithubData,
          changeText: _store.setUsername,
        );
      }),
    );
  }
}
