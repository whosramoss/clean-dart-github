import 'package:flutter/material.dart';
import 'package:github_commons/module/domain/entities/github_repository_entity.dart';
import 'package:github_commons/shared/components/github_repository_widget.dart';

import '../../module/domain/entities/github_language_entity.dart';
import '../../module/domain/entities/github_profile_entity.dart';
import 'github_background_widget.dart';
import 'github_language_widget.dart';
import 'github_profile_widget.dart';
import 'github_tabs_widget.dart';

class GithubBodyWidget extends StatelessWidget {
  final GithubProfileEntity profile;
  final List<GithubLanguageEntity> lstLanguages;
  final List<GithubRepositoryEntity> lstRepositories;

  const GithubBodyWidget({
    Key? key,
    required this.profile,
    required this.lstLanguages,
    required this.lstRepositories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return GithubBackgroundWidget(
    return NestedScrollView(
      headerSliverBuilder: (_, value) => [
        GithubProfileWidget(profile: profile),
      ],
      body: GithubTabsWidget(
        tabRepositories: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: lstRepositories.length,
          itemBuilder: (_, index) {
            return GithubRepositoryWidget(repo: lstRepositories[index]);
          },
        ),
        tabLanguages: GridView.builder(
          itemCount: lstLanguages.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 10,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (_, index) {
            return GithubLanguageWidget(lang: lstLanguages[index]);
          },
        ),
      ),
      //),
    );
  }
}
