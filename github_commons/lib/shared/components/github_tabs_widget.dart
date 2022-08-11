import 'package:flutter/material.dart';

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
      child: Column(children: [
        SizedBox(
          child: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade600,
            indicatorColor: Colors.black,
            tabs: const [
              Tab(text: 'Repositories'),
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
    );
  }
}
