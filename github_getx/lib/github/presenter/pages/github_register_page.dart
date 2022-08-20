import 'package:flutter/material.dart';
import 'package:github_commons/main.dart';
import '../controllers/github_controller.dart';
import '../../utils/exports.dart';

class GithubRegisterPage extends GetView<GithubController> {
  GithubRegisterPage({Key? key}) : super(key: key);

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Obx(() {
        return GithubRegisterBodyWidget(
          textUsername: controller.username.value,
          textError: controller.error.value.errorMessage,
          isLoading: controller.isLoading.value,
          controller: _textController,
          action: controller.setGithubData,
          changeText: controller.setUsername,
        );
      }),
    );
  }
}
