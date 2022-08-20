import 'package:flutter/material.dart';

import '../theme/github_theme.dart';

class GithubBackgroundWidget extends StatelessWidget {
  final Widget child;
  const GithubBackgroundWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: GithubTheme.primaryColor,
      ),
      child,
    ]);
  }
}
