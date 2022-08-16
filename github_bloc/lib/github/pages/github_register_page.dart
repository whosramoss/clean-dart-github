import 'package:flutter/material.dart';
import 'package:github_bloc/github/blocs/github_bloc.dart';
import 'package:github_bloc/github/blocs/github_state.dart';
import 'package:github_commons/main.dart';

import '../blocs/github_events.dart';

class GithubRegisterPage extends StatefulWidget {
  const GithubRegisterPage({Key? key}) : super(key: key);

  @override
  State<GithubRegisterPage> createState() => GithubRegisterPageState();
}

class GithubRegisterPageState extends State<GithubRegisterPage> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<GithubBloc, GithubState>(
        builder: (context, state) {
          final textUsername =
              state is UsernameStateCompleted ? state.username : '';

          final textError =
              state is DataErrorState ? state.error?.errorMessage : null;

          final isLoading = state is DataLoadingState;

          return GithubRegisterBodyWidget(
            textUsername: textUsername,
            textError: textError,
            isLoading: isLoading,
            controller: _textController,
            action: () {
              final value = _textController.value.text;
              BlocProvider.of<GithubBloc>(context).add(
                GetGithubData(username: value),
              );
            },
            changeText: (value) {
              final value = _textController.value.text;
              BlocProvider.of<GithubBloc>(context).add(
                SetUsernameText(username: value),
              );
            },
          );
        },
      ),
    );
  }
}
