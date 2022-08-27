import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:github_commons/main.dart';

import '../blocs/github_events.dart';
import '../blocs/github_bloc.dart';
import '../blocs/github_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class GithubRegisterPage extends StatefulWidget {
  const GithubRegisterPage({Key? key}) : super(key: key);

  @override
  State<GithubRegisterPage> createState() => GithubRegisterPageState();
}

class GithubRegisterPageState extends State<GithubRegisterPage> {
  var textController = TextEditingController();
  var textUsername = '';
  var textError = '';
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    final bloc = context.select((GithubBloc i) => i);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocBuilder<GithubBloc, GithubState>(
        bloc: bloc,
        builder: (BuildContext context, GithubState state) {
          if (state is UsernameStateCompleted) {
            textUsername = state.username;
          }

          if (state is LoadingState) {
            isLoading = true;
            textError = '';
          }

          if (state is ErrorState) {
            isLoading = false;
            textError = state.error?.errorMessage ?? 'Internal Error';
          }

          if (state is SuccessState) {
            isLoading = false;
            textUsername = '';
            textController.clear();
            textError = '';
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushNamed(GithubRoutes.profile);
            });
          }

          return GithubRegisterBodyWidget(
            textUsername: textUsername,
            textError: textError,
            isLoading: isLoading,
            controller: textController,
            action: () {
              bloc.add(GetGithubData(username: textController.value.text));
            },
            changeText: (value) {
              bloc.add(SetUsernameText(username: value));
            },
          );
        },
      ),
    );
  }
}
