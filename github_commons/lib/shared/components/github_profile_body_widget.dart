import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:github_commons/module/domain/enums/github_type_list_enum.dart';
import 'package:github_commons/shared/theme/github_theme.dart';
import '../../module/domain/entities/github_repository_entity.dart';
import '../../module/domain/entities/github_language_entity.dart';
import '../../module/domain/entities/github_profile_entity.dart';

import 'github_background_widget.dart';
import 'github_item_widget.dart';
import 'github_profile_widget.dart';
import 'github_tabs_widget.dart';

class GithubProfileBodyWidget extends StatelessWidget {
  final GithubProfileEntity profile;
  final List<GithubLanguageEntity> lstLanguages;
  final List<GithubRepositoryEntity> lstRepositories;
  final Function(String) openRepository;

  const GithubProfileBodyWidget({
    Key? key,
    required this.profile,
    required this.lstLanguages,
    required this.lstRepositories,
    required this.openRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GithubBackgroundWidget(
      child: NestedScrollView(
        headerSliverBuilder: (_, value) => [
          GithubProfileWidget(
            profile: profile,
            totalRepositories: lstRepositories.length,
          ),
        ],
        body: GithubTabsWidget(
          tabRepositories: _buildList(
            lst: lstRepositories,
            type: GithubTypeListEnum.repositories,
          ),
          tabLanguages: _buildList(
            lst: lstLanguages,
            type: GithubTypeListEnum.statistics,
          ),
        ),
      ),
    );
  }

  Widget _buildList({required GithubTypeListEnum type, required List lst}) {
    if (lst.isEmpty) {
      return const Center(
        child: Text('No data found', style: GithubTheme.simpleStyleText),
      );
    }

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: lst.length,
      itemBuilder: (_, index) {
        switch (type) {
          case GithubTypeListEnum.repositories:
            final value = lst[index] as GithubRepositoryEntity;
            return InkWell(
              onTap: () => openRepository(value.htmlUrl),
              child: GithubItemWidget(
                title: value.name,
                subtitle: value.description,
              ),
            );
          case GithubTypeListEnum.statistics:
            final value = lst[index] as GithubLanguageEntity;
            return GithubItemWidget(
              // icon: value.icon,
              title: value.name,
              subtitle: '${value.average}%, used in ${value.total} projects',
            );
        }
      },
    );
  }
}
