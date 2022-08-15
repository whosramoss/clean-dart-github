import 'package:flutter/material.dart';
import 'package:github_commons/main.dart';
import 'package:github_getx/github/pages/github_profile_page.dart';

import 'github/bindings/github_bindings.dart';
import 'github/pages/github_register_page.dart';
import 'github/utils/github_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Github Getx',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      initialBinding: GithubBindings(),
      getPages: [
        GetPage(name: Routes.register, page: () => GithubRegisterPage()),
        GetPage(name: Routes.profile, page: () => const GithubProfilePage()),
      ],
    );
  }
}
