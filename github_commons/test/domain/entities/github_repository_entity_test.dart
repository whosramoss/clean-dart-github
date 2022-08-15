import 'package:flutter_test/flutter_test.dart';
import 'package:github_commons/module/domain/entities/github_repository_entity.dart';

void main() {
  const id = 383940847;
  const nodeId = "MDEwOlJlcG9zaXRvcnkzODM5NDA4NDc=";
  const name = "admin-portal";
  const fullName = "whosramoss/admin-portal";
  const htmlUrl = "https://github.com/whosramoss/admin-portal";
  const description = "Invoice Ninja client built with Flutter";
  const fork = true;
  var createdAt = DateTime.now();
  var updatedAt = DateTime.now();
  var pushedAt = DateTime.now();
  const topics = ['FLUTTER', 'CODE', 'SERVICE'];
  const language = 'dart';

  group('[GithubRepositoryEntity]', () {
    test('New instance with new parameters', () {
      var entity = GithubRepositoryEntity(
        id: id,
        nodeId: nodeId,
        name: name,
        fullName: fullName,
        htmlUrl: htmlUrl,
        fork: fork,
        description: description,
        createdAt: createdAt,
        updatedAt: updatedAt,
        pushedAt: pushedAt,
        topics: topics,
        language: language,
      );

      expect(entity, isA<GithubRepositoryEntity>());
      expect(entity.id, equals(id));
      expect(entity.nodeId, equals(nodeId));
      expect(entity.name, equals(name));
      expect(entity.fullName, equals(fullName));
      expect(entity.htmlUrl, equals(htmlUrl));
      expect(entity.fork, equals(fork));
      expect(entity.description, equals(description));

      expect(entity.createdAt, equals(createdAt));
      expect(entity.updatedAt, equals(updatedAt));

      expect(entity.pushedAt, equals(pushedAt));
      expect(entity.topics, equals(topics));
      expect(entity.language, equals(language));
    });

    test('New instance with copied parameters', () {
      const entity = GithubRepositoryEntity(
        id: 0,
        nodeId: '',
        name: '',
        fullName: '',
        htmlUrl: '',
        fork: false,
        description: '',
        createdAt: null,
        updatedAt: null,
        pushedAt: null,
        topics: [],
        language: '',
      );

      final newEntity = entity.copyWith(
        id: id,
        nodeId: nodeId,
        name: name,
        fullName: fullName,
        htmlUrl: htmlUrl,
        fork: fork,
        description: description,
        createdAt: createdAt,
        updatedAt: updatedAt,
        pushedAt: pushedAt,
        topics: topics,
        language: language,
      );
      expect(newEntity, isA<GithubRepositoryEntity>());
      expect(newEntity.id, equals(id));
      expect(newEntity.nodeId, equals(nodeId));
      expect(newEntity.name, equals(name));
      expect(newEntity.fullName, equals(fullName));
      expect(newEntity.htmlUrl, equals(htmlUrl));
      expect(newEntity.fork, equals(fork));
      expect(newEntity.description, equals(description));
      expect(newEntity.createdAt, equals(createdAt));
      expect(newEntity.updatedAt, equals(updatedAt));
      expect(newEntity.pushedAt, equals(pushedAt));
      expect(newEntity.topics, equals(topics));
      expect(newEntity.language, equals(language));
    });
  });
}
