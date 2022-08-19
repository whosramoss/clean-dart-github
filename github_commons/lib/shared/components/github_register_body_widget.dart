import 'package:flutter/material.dart';

import '../theme/github_theme.dart';
import 'github_background_widget.dart';
import 'github_button_widget.dart';
import 'github_icon_widget.dart';

class GithubRegisterBodyWidget extends StatelessWidget {
  final String textUsername;
  final String textField;
  final String textButton;
  final String? textError;
  final bool isLoading;
  final Function(String) changeText;
  final VoidCallback action;
  final TextEditingController controller;

  const GithubRegisterBodyWidget({
    Key? key,
    this.textField = 'Type your profile',
    this.textButton = 'Search Profile',
    this.textError,
    required this.changeText,
    required this.isLoading,
    required this.action,
    required this.textUsername,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GithubBackgroundWidget(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const GithubIconWidget(),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: GithubTheme.secondColor.withOpacity(.1),
                    border: Border.all(
                      color: GithubTheme.secondColor.withOpacity(.5),
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    onChanged: changeText,
                    controller: controller,
                    enabled: !isLoading,
                    maxLines: 1,
                    style: GithubTheme.simpleStyleText,
                    decoration: InputDecoration(
                      hintText: textField,
                      hintStyle: const TextStyle(
                        fontFamily: GithubTheme.fontFamilyName,
                        package: GithubTheme.themeName,
                        color: GithubTheme.secondColor,
                      ),
                      errorText: textError,
                      errorStyle: const TextStyle(
                        fontFamily: GithubTheme.fontFamilyName,
                        package: GithubTheme.themeName,
                        color: GithubTheme.secondColor,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GithubButtonWidget(
                  title: textButton,
                  onPressed: textUsername.isNotEmpty ? action : null,
                  isLoading: isLoading,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
