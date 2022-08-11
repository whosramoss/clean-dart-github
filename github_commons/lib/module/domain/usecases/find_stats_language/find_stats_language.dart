import 'package:github_commons/module/domain/entities/github_language_entity.dart';
import 'package:github_commons/module/domain/entities/github_repository_entity.dart';
import 'package:github_commons/module/domain/usecases/find_stats_language/i_find_stats_language.dart';

class FindStatsLanguage implements IFindStatsLanguage {
  @override
  List<GithubLanguageEntity> call(List<GithubRepositoryEntity> repositories) {
    final languages = <String>[];
    final lst = <GithubLanguageEntity>[];

    repositories.map((e) => languages.add(e.language)).toList();

    for (var name in languages) {
      var icon = _getIcon(name);
      var total = _getTotal(languages, name);
      var average = total / languages.length;

      lst.add(GithubLanguageEntity(
        name: name,
        icon: icon,
        average: average,
        total: total,
      ));
    }

    return lst;
  }

  String _getIcon(String name) {
    return 'https://raw.githubusercontent.com/devicons/devicon/master/icons/$name/$name-original.svg';
  }

  int _getTotal(List<String> languages, String name) {
    return languages.where((lName) => lName == name).toList().length;
  }
}
