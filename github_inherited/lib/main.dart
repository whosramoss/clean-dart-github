import 'package:flutter/material.dart';

import 'package:github_commons/main.dart';

import 'presenter/inherited/github_inherited_widget.dart';
import 'presenter/inherited/github_inherited_action.dart';
import 'presenter/pages/github_register_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GithubInheritedWidget(
      action: GithubAction(),
      child: MaterialApp(
        title: 'Github Inherited',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        routes: {
          GithubRoutes.register: (_) => const GithubRegisterPage(),
        },
      ),
    );
  }
}
