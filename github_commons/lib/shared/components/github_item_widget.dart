import 'package:flutter/material.dart';

class GithubItemWidget extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final Widget? leading;

  const GithubItemWidget({
    Key? key,
    required this.title,
    this.subtitle,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
      ),
    );
  }
}
