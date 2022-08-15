import 'package:flutter/material.dart';
import 'package:github_commons/main.dart';
import '../controllers/github_controller.dart';

class GithubProfilePage extends GetView<GithubController> {
  const GithubProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const GithubAppBarWidget(),
      body: Obx(() {
        return GithubProfileBodyWidget(
          openRepository: (value) => controller.openUrl(value),
          profile: controller.profile.value,
          lstLanguages: controller.lstLanguages,
          lstRepositories: controller.lstRepositories,
        );
      }),
    );
  }
}
