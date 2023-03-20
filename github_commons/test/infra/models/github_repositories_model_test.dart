import 'package:flutter_test/flutter_test.dart';
import 'package:github_commons/module/domain/entities/github_repository_entity.dart';
import 'package:github_commons/module/infra/models/github_repository_model.dart';

void main() {
  const mockModel = GithubRepositoryModel(
    id: 1,
    nodeId: "abcde:",
    name: "dart-portal",
    fullName: "whosramoss/dart-portal",
    htmlUrl: "https://github.com/whosramoss/dart-portal",
    description: "dart",
    fork: false,
    createdAt: null,
    updatedAt: null,
    pushedAt: null,
    topics: ['FLUTTER', 'CODE', 'SERVICE'],
    language: 'dart',
  );

  const mockEntity = GithubRepositoryEntity(
    id: 1,
    nodeId: "abcde:",
    name: "dart-portal",
    fullName: "whosramoss/dart-portal",
    htmlUrl: "https://github.com/whosramoss/dart-portal",
    description: "dart",
    fork: false,
    createdAt: null,
    updatedAt: null,
    pushedAt: null,
    topics: ['FLUTTER', 'CODE', 'SERVICE'],
    language: 'dart',
  );

  test('model to entity', () {
    var entity = mockModel.toEntity();

    expect(entity, isA<GithubRepositoryEntity>());
    expect(entity, equals(mockEntity));
  });

  test('entity to model', () {
    var model = GithubRepositoryModel.fromEntity(mockEntity);

    expect(model, isA<GithubRepositoryModel>());
    expect(model, equals(mockModel));
  });
}
