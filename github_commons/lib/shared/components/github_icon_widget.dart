import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/github_theme.dart';

class GithubIconWidget extends StatelessWidget {
  const GithubIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'assets/icons/github_icon.svg',
          package: 'github_commons',
          excludeFromSemantics: true,
          width: 80,
          height: 80,
        ),
      ),
      const SizedBox(height: 20),
      const Text(
        "Github",
        style: TextStyle(
          fontFamily: GithubTheme.fontFamilyName,
          package: GithubTheme.themeName,
          color: GithubTheme.secondColor,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 20),
    ]);
  }
}
