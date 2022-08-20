import 'package:flutter/material.dart';
import 'package:github_commons/main.dart';

import '../blocs/github_events.dart';
import '../blocs/github_bloc.dart';
import '../blocs/github_state.dart';
import '../../../../shared/utils/exports.dart';

class GithubProfilePage extends StatefulWidget {
  const GithubProfilePage({Key? key}) : super(key: key);

  @override
  State<GithubProfilePage> createState() => _GithubProfilePageState();
}

class _GithubProfilePageState extends State<GithubProfilePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.select((GithubBloc i) => i);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const GithubAppBarWidget(),
      body: BlocBuilder<GithubBloc, GithubState>(builder: (context, state) {
        if (state is SuccessState) {
          return GithubProfileBodyWidget(
            openRepository: (value) {
              bloc.add(OpenRepository(url: value));
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
