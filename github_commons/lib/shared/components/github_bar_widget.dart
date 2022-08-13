import 'package:flutter/material.dart';

import '../theme/github_theme.dart';

class GithubAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const GithubAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      shadowColor: null,
      backgroundColor: GithubTheme.primaryColor,
      leading: const BackButton(color: GithubTheme.secondColor),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64.0);
}
