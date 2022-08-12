import 'dart:ui';

import 'package:flutter/material.dart';

class GithubBackgroundWidget extends StatelessWidget {
  final Widget child;
  const GithubBackgroundWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Image.asset(
          'assets/images/bg.jpeg',
          fit: BoxFit.cover,
          package: 'github_commons',
        ),
      ),
      Center(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
          child: Container(alignment: Alignment.center),
        ),
      ),
      child,
    ]);
  }
}
