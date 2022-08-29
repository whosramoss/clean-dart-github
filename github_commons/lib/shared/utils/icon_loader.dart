import 'package:flutter/material.dart';
import 'package:github_commons/main.dart';

class IconLoader {
  static String get emoji =>
      'https://www.svgrepo.com/show/404222/thinking-face.svg';

  static Widget getIcon(String path) {
    return FutureBuilder(
      future: isVerifiedSvg(path),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!
              ? SvgPicture.network(path, width: 50)
              : SvgPicture.network(emoji,
                  width: 50, color: GithubTheme.secondColor);
        }
        return const CircularProgressIndicator();
      },
    );
  }

  static Future<bool> isVerifiedSvg(String path) async {
    try {
      await Dio().get(path);
      return true;
    } catch (_) {
      return false;
    }
  }
}
