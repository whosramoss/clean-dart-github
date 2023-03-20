import 'package:flutter_test/flutter_test.dart';
import 'package:github_commons/module/domain/entities/github_repository_entity.dart';

void main() {
  const mock = GithubRepositoryEntity(
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

  test('New instance with new parameters', () {
    var entity = mock;

    expect(entity, isA<GithubRepositoryEntity>());
    expect(entity, equals(mock));
  });

  test('New instance with copied parameters', () {
    final entity = GithubRepositoryEntity.empty.copyWith(topics: mock.topics);
    expect(entity, isA<GithubRepositoryEntity>());
    expect(entity.topics, equals(mock.topics));
  });
}
