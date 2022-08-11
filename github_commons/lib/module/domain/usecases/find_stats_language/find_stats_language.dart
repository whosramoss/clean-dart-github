import 'package:github_commons/module/domain/entities/github_language_entity.dart';
import 'package:github_commons/module/domain/entities/github_repository_entity.dart';
import 'package:github_commons/module/domain/usecases/find_stats_language/i_find_stats_language.dart';

class FindStatsLanguage implements IFindStatsLanguage {
  @override
  List<GithubLanguageEntity> call(List<GithubRepositoryEntity> repositories) {
    final languages = <String>[];
    final lst = <GithubLanguageEntity>[];

    repositories.map((e) => languages.add(e.language)).toList();

    languages.map((name) {
      var value = GithubLanguageEntity(
        name: name,
        icon: _getIcon(name),
        average: _getTotal(languages, name) / languages.length,
        total: _getTotal(languages, name),
      );

      lst.add(value);
    }).toList();

    return lst;
  }

  String _getIcon(String name) =>
      'https://raw.githubusercontent.com/devicons/devicon/master/icons/$name/$name-original.svg';

  int _getTotal(List<String> languages, String name) =>
      languages.where((lName) => lName == name).toList().length;
}
