import 'package:flutter/material.dart';

import '../theme/github_theme.dart';

class GithubTabsWidget extends StatelessWidget {
  final Widget tabRepositories;
  final Widget tabLanguages;

  const GithubTabsWidget({
    Key? key,
    required this.tabRepositories,
    required this.tabLanguages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        decoration: BoxDecoration(
          color: GithubTheme.secondColor.withOpacity(0.06),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(children: [
          SizedBox(
            child: TabBar(
              labelStyle: GithubTheme.simpleStyleText,
              unselectedLabelColor: GithubTheme.secondColor.withOpacity(.4),
              indicatorColor: GithubTheme.secondColor.withOpacity(0),
              tabs: const [
                Tab(text: 'My Repositories'),
                Tab(text: 'Languages'),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TabBarView(
                children: [
                  tabRepositories,
                  tabLanguages,
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
