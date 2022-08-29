import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:github_commons/main.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'app/presenter/bindings/github_bindings.dart';
import 'app/presenter/pages/github_profile_page.dart';
import 'app/presenter/pages/github_register_page.dart';

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

    return GetMaterialApp(
      title: 'Github Getx',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      initialBinding: GithubBindings(),
      getPages: [
        GetPage(
          name: GithubRoutes.register,
          page: () => GithubRegisterPage(),
        ),
        GetPage(
          name: GithubRoutes.profile,
          page: () => const GithubProfilePage(),
        ),
      ],
    );
  }
}
