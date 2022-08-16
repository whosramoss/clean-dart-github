import 'package:flutter/material.dart';
import 'package:github_bloc/github/blocs/github_events.dart';
import 'package:github_commons/main.dart';

import '../blocs/github_bloc.dart';
import '../blocs/github_state.dart';

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
      body: BlocBuilder<GithubBloc, GithubState>(builder: (context, state) {
        if (state is DataLoadingState) {
          return const CircularProgressIndicator();
        }

        if (state is DataErrorState) {
          return Text(state.error?.errorMessage ?? 'internal error');
        }

        if (state is DataSuccessState) {
          return GithubProfileBodyWidget(
            openRepository: (value) {
              BlocProvider.of<GithubBloc>(context).add(
                OpenRepository(url: value),
              );
            },
            profile: state.profile,
            lstLanguages: state.lstLanguages,
            lstRepositories: state.lstRepositories,
          );
        }

        return Container();
      }),
    );
  }
}
