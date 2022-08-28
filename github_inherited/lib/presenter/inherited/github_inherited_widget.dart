import 'package:flutter/material.dart';

import 'github_inherited_action.dart';

class GithubInheritedWidget extends InheritedWidget {
  final GithubInheritedAction action;

  const GithubInheritedWidget({
    Key? key,
    required this.action,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(GithubInheritedWidget oldWidget) {
    return oldWidget.action != action;
  }

  static GithubInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GithubInheritedWidget>();
  }
}
