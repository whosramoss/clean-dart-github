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

  Future<bool> isVerifiedSvg(String? path) async {
    try {
      bool hasPath = path != null && path.isNotEmpty;
      if (!hasPath) return false;
      await Dio().get(path);
      return true;
    } catch (_) {
      return false;
    }
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
        child: FutureBuilder(
          future: isVerifiedSvg(icon),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return _ItemWidget(
                title: title,
                subtitle: subtitle,
                leading: const CircularProgressIndicator(color: GithubTheme.white),
              );
            }

            if (snapshot.data!) {
              return _ItemWidget(
                title: title,
                subtitle: subtitle,
                leading: SvgPicture.network(icon!, width: 50),
              );
            }

            return _ItemWidget(title: title, subtitle: subtitle, leading: null);
          },
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final String title, subtitle;
  final Widget? leading;
  const _ItemWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
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
    );
  }
}
