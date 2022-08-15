import 'package:flutter/material.dart';
import 'package:github_commons/main.dart';

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

  Widget? _buildIcon() {
    if (icon == null) return null;

    if (icon!.contains('.svg')) {
      return SvgPicture.network(icon!, width: 50);
    }

    return CircleAvatar(
      backgroundColor: Colors.transparent,
      backgroundImage: NetworkImage(icon!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          color: GithubTheme.secondColor.withOpacity(0.06),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: _buildIcon(),
          title: Text(
            title,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: GithubTheme.simpleStyleText.copyWith(fontSize: 14),
          ),
          subtitle: Text(
            subtitle.isEmpty ? 'Empty Description' : subtitle,
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
