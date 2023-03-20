import 'package:flutter/material.dart';

import 'package:github_commons/main.dart';
import 'package:provider/provider.dart';

import 'app/presenter/pages/github_profile_page.dart';
import 'app/presenter/pages/github_register_page.dart';
import 'app/presenter/provider/github_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GithubProvider>(
      create: (context) => GithubProvider(
        Dio(),
        GithubDatasource(Dio()),
        GithubRepository(GithubDatasource(Dio())),
        GetProfile(GithubRepository(GithubDatasource(Dio()))),
        GetRepositories(GithubRepository(GithubDatasource(Dio()))),
        GetLanguages(),
        UrlOpen(),
      ),
      child: MaterialApp(
        title: 'Github Provider',
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
