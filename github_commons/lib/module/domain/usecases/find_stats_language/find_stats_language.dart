import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:github_commons/module/domain/entities/github_language_entity.dart';
import 'package:github_commons/module/domain/entities/github_repository_entity.dart';
import 'package:github_commons/module/domain/usecases/find_stats_language/i_find_stats_language.dart';

class FindStatsLanguage implements IFindStatsLanguage {
  @override
  List<GithubLanguageEntity> call(List<GithubRepositoryEntity> repositories) {
    var languages = <String>[];
    var reposWithoutLanguage = 0;

    for (var r in repositories) {
      if (r.language.isNotEmpty) {
        languages.add(r.language);
      } else {
        reposWithoutLanguage++;
      }
    }
    languages = languages.toSet().toList();
    log("languages = ${languages.length} => $languages");
    log("repositories = ${repositories.length}");
    log("reposWithoutLanguage = $reposWithoutLanguage");

    final lastItem = GithubLanguageEntity(
      name: 'Repos without lang (Forks)',
      total: reposWithoutLanguage,
      icon: _getIcon(haveLanguage: false),
      average: _getAverage(repositories.length, reposWithoutLanguage),
    );

    final len = repositories.length - reposWithoutLanguage;
    final lst = <GithubLanguageEntity>[];
    for (var name in languages) {
      int total = repositories.where((i) => i.language == name).length;

      final item = GithubLanguageEntity(
        name: name,
        total: total,
        icon: _getIcon(
          haveLanguage: true,
          name: name.toLowerCase(),
        ),
        average: _getAverage(len, repositories.length - total),
      );

      lst.add(item);
    }

    lst.add(lastItem);

    final value = lst.toSet().toList();
    for (var v in value) {
      log('-----------');
      log(v.toString());
      log('-----------');
    }
    return value;
  }

  String _getIcon({required bool haveLanguage, String? name}) {
    return '';
    if (!haveLanguage) {
      return 'https://www.cambridge.org/elt/blog/wp-content/uploads/2019/07/Crying-Face-Emoji.png';
    }

    return 'https://raw.githubusercontent.com/devicons/devicon/master/icons/$name/$name-original.svg';
  }

  int _getTotal(List<String> languages, String name) {
    return languages.where((lName) => lName == name).toList().length;
  }

  String _getAverage(int len, int total) {
    final calc = ((total + len) / 2).toStringAsFixed(3);
    final value = 100.0 - double.parse(calc);
    return '${value.toStringAsFixed(0)}%';
  }
}
