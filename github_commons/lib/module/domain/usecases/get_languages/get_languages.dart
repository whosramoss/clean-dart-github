import 'package:github_commons/module/domain/entities/github_language_entity.dart';
import 'package:github_commons/module/domain/entities/github_repository_entity.dart';
import 'i_get_languages.dart';

class GetLanguages implements IGetLanguages {
  @override
  List<GithubLanguageEntity> call(List<GithubRepositoryEntity> repositories) {
    var languages = <String>[];
    var lst = <GithubLanguageEntity>[];
    var reposWithoutLanguage = 0;

    for (var e in repositories) {
      e.language.isNotEmpty ? languages.add(e.language) : reposWithoutLanguage++;
    }

    final List<String> langs = languages;
    languages = languages.toSet().toList();

    for (var name in languages) {
      lst.add(GithubLanguageEntity(
        name: name,
        total: _getTotal(langs, name),
        icon: _getIcon(name.toLowerCase()),
        average: _getAverage(lst: repositories, name: name),
      ));
    }

    if (reposWithoutLanguage != 0) {
      lst.add(GithubLanguageEntity(
        name: 'Repos without lang (Forks)',
        total: reposWithoutLanguage,
        average: _getAverage(hasLanguage: false, lst: repositories),
        icon: '',
      ));
    }

    return lst;
  }

  String _getIcon(String name) =>
      'https://raw.githubusercontent.com/devicons/devicon/master/icons/$name/$name-original.svg';

  int _getTotal(List<String> lst, String name) =>
      lst.where((e) => e.toLowerCase() == name.toLowerCase()).toList().length;

  String _getAverage({
    required List<GithubRepositoryEntity> lst,
    bool hasLanguage = true,
    String? name,
  }) {
    int value = lst.where((i) => hasLanguage ? i.language == name : i.language.isEmpty).length;

    return '${((value / lst.length) * 100).toStringAsFixed(0)}%';
  }
}
