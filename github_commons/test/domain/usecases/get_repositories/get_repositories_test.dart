import 'package:flutter_test/flutter_test.dart';
import 'package:github_commons/module/domain/entities/github_repository_entity.dart';
import 'package:github_commons/module/domain/usecases/get_repositories/get_repositories.dart';
import 'package:github_commons/module/domain/usecases/get_repositories/i_get_repositories.dart';

import 'package:github_commons/module/infra/repositories/github_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_repositories_test.mocks.dart';

@GenerateMocks([GithubRepository])
void main() {
  final repository = MockGithubRepository();

  late IGetRepositories usecase;

  const entity = GithubRepositoryEntity(
    id: 383940847,
    nodeId: "MDEwOlJlcG9zaXRvcnkzODM5NDA4NDc:",
    name: "admin-portal",
    fullName: "whosramoss/admin-portal",
    htmlUrl: "https://github.com/whosramoss/admin-portal",
    description: "Invoice Ninja client built with Flutter",
    fork: true,
    createdAt: null,
    updatedAt: null,
    pushedAt: null,
    topics: ['FLUTTER', 'CODE', 'SERVICE'],
    language: 'dart',
  );

  setUpAll(() {
    usecase = GetRepositories(repository);
  });

  test('All instances injected', () {
    expect(repository, isA<MockGithubRepository>());
    expect(usecase, isA<IGetRepositories>());
  });

  test('Return a List<GithubRepositoryEntity>', () async {
    const username = "whosramoss";

    clearInteractions(repository);

    when(repository.getRepositories(username)).thenAnswer(
      (_) async => [entity, entity],
    );

    var result = await usecase(username);

    expect(result, isNotNull);
    expect(result, isA<List<GithubRepositoryEntity>>());
  });
}
