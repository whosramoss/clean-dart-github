import 'package:flutter_test/flutter_test.dart';
import 'package:github_commons/module/domain/entities/github_language_entity.dart';
import 'package:github_commons/module/domain/entities/github_repository_entity.dart';
import 'package:github_commons/module/domain/usecases/get_languages/get_languages.dart';
import 'package:github_commons/module/domain/usecases/get_languages/i_get_languages.dart';

void main() {
  late IGetLanguages usecase;

  const lstRepositoriesEntity = <GithubRepositoryEntity>[
    GithubRepositoryEntity(
      id: 1,
      nodeId: "abcdef:",
      name: "dart-project",
      fullName: "whosramoss/dart-project",
      htmlUrl: "https://github.com/whosramoss/dart-project",
      description: "dart-project",
      fork: true,
      createdAt: null,
      updatedAt: null,
      pushedAt: null,
      topics: ['FLUTTER', 'CODE', 'SERVICE'],
      language: 'Dart',
    ),
    GithubRepositoryEntity(
      id: 2,
      nodeId: "abcdef:",
      name: "go-project",
      fullName: "whosramoss/go-project",
      htmlUrl: "https://github.com/whosramoss/admin-portal",
      description: "go-project",
      fork: true,
      createdAt: null,
      updatedAt: null,
      pushedAt: null,
      topics: ['GOLANG', 'CODE', 'SERVICE'],
      language: 'Go',
    ),
  ];
  const resultEntity = <GithubLanguageEntity>[
    GithubLanguageEntity(
      name: 'Dart',
      icon: 'https://raw.githubusercontent.com/devicons/devicon/master/icons/dart/dart-original.svg',
      average: '50%',
      total: 1,
    ),
    GithubLanguageEntity(
      name: 'Go',
      icon: 'https://raw.githubusercontent.com/devicons/devicon/master/icons/go/go-original.svg',
      average: '50%',
      total: 1,
    ),
  ];

  setUpAll(() {
    usecase = GetLanguages();
  });

  test('All instances injected', () {
    expect(usecase, isA<IGetLanguages>());
  });

  test('Return a List<GithubLanguageEntity>', () {
    var result = usecase(lstRepositoriesEntity);

    expect(result, isNotNull);
    expect(result, isA<List<GithubLanguageEntity>>());

    for (var i = 0; i < result.length; i++) {
      if (i != (result.length - 1)) {
        expect(result[i], equals(resultEntity[i]));
      }
    }
  });
}
