import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_commons/main.dart';

import 'github/blocs/github_bloc.dart';
import 'github/pages/github_profile_page.dart';
import 'github/pages/github_register_page.dart';
import 'github/utils/exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return BlocProvider<GithubBloc>(
      create: (context) {
        return GithubBloc(
          UrlOpen(),
          Dio(),
          GithubDatasource(Dio()),
          GithubRepository(GithubDatasource(Dio())),
          FindProfile(GithubRepository(GithubDatasource(Dio()))),
          FindRepositories(GithubRepository(GithubDatasource(Dio()))),
          FindLanguages(),
        );
      },
      child: MaterialApp(
        title: 'Github Bloc',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        routes: {
          GithubRoutes.register: (_) => const GithubRegisterPage(),
          GithubRoutes.profile: (_) => const GithubProfilePage(),
        },
      ),
    );
  }
}
