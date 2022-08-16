import 'package:flutter/material.dart';
import 'package:github_bloc/github/blocs/github_bloc.dart';
import 'package:github_bloc/github/pages/github_profile_page.dart';
import 'package:github_commons/main.dart';

import 'github/pages/github_register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) {
          return GithubBloc(
            RepositoryProvider.of<FindProfile>(context),
            RepositoryProvider.of<FindRepositories>(context),
            RepositoryProvider.of<FindStatsLanguage>(context),
            RepositoryProvider.of<IUrlOpen>(context),
          );
        }),
      ],
      child: MaterialApp(
        title: 'Github Bloc',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        routes: {
          '/': (_) => const GithubRegisterPage(),
          '/profile': (_) => const GithubProfilePage(),
        },
      ),
    );
  }
}
