import 'package:github_commons/module/domain/entities/github_language_entity.dart';
import 'package:github_commons/module/domain/entities/github_repository_entity.dart';
import 'package:github_commons/module/domain/usecases/find_stats_language/i_find_stats_language.dart';

class FindStatsLanguage implements IFindStatsLanguage {
  @override
  List<GithubLanguageEntity> call(List<GithubRepositoryEntity> repositories) {
    var languages = <String>[];
    var lst = <GithubLanguageEntity>[];
    var reposWithoutLanguage = 0;

    for (var e in repositories) {
      bool hasLanguage = e.language.isNotEmpty;
      hasLanguage ? languages.add(e.language) : reposWithoutLanguage++;
    }

    final aux = languages;
    languages = languages.toSet().toList();

    for (var name in languages) {
      lst.add(GithubLanguageEntity(
        name: name,
        total: _getTotal(aux, name),
        icon: _getIcon(hasLanguage: true, name: name.toLowerCase()),
        average: _getAverage(lst: repositories, name: name),
      ));
    }

    if (reposWithoutLanguage != 0) {
      lst.add(GithubLanguageEntity(
        name: 'Repos without lang (Forks)',
        total: reposWithoutLanguage,
        icon: _getIcon(hasLanguage: false),
        average: _getAverage(hasLanguage: false, lst: repositories),
      ));
    }

    return lst;
  }

  String _getIcon({required bool hasLanguage, String? name}) {
    if (!hasLanguage) {
      return 'https://www.cambridge.org/elt/blog/wp-content/uploads/2019/07/Crying-Face-Emoji.png';
    }

    return 'https://raw.githubusercontent.com/devicons/devicon/master/icons/$name/$name-original.svg';
  }

  int _getTotal(List<String> lst, String name) {
    return lst
        .where((lName) => lName.toLowerCase() == name.toLowerCase())
        .toList()
        .length;
  }

  String _getAverage({
    required List<GithubRepositoryEntity> lst,
    bool hasLanguage = true,
    String? name,
  }) {
    var value = lst.where((i) {
      return hasLanguage ? i.language == name : i.language.isEmpty;
    });

    return '${((value.length / lst.length) * 100).toStringAsFixed(0)}%';
  }
}
