import 'package:flutter/material.dart';
import 'package:github_commons/main.dart';

import '../utils/icon_loader.dart';

class GithubItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? icon;

  const GithubItemWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final leading =
        icon != null && icon!.isNotEmpty ? IconLoader.getIcon(icon!) : null;
    final text = subtitle.isEmpty ? 'Empty Description' : subtitle;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          color: GithubTheme.secondColor.withOpacity(0.06),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: leading,
          title: Text(
            title,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: GithubTheme.simpleStyleText.copyWith(fontSize: 14),
          ),
          subtitle: Text(
            text,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: GithubTheme.simpleStyleText.copyWith(
              fontSize: 14,
              color: GithubTheme.secondColor.withOpacity(.5),
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
        ),
      ),
    );
  }
}
