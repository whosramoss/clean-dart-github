import 'package:flutter_test/flutter_test.dart';
import 'package:github_commons/module/domain/entities/github_profile_entity.dart';
import 'package:github_commons/module/domain/entities/github_repository_entity.dart';
import 'package:github_commons/module/domain/errors/github_errors.dart';
import 'package:github_commons/module/domain/repositories/i_github_repository.dart';
import 'package:github_commons/module/external/datasources/github_datasource.dart';
import 'package:github_commons/module/infra/models/github_profile_model.dart';
import 'package:github_commons/module/infra/models/github_repository_model.dart';
import 'package:github_commons/module/infra/repositories/github_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'github_repository_test.mocks.dart';

@GenerateMocks([GithubDatasource])
void main() {
  final datasource = MockGithubDatasource();

  late IGithubRepository repository;

  const username = 'whosramoss';

  const mockProfile = GithubProfileModel(
    username: "whosramoss",
    id: 20142337,
    nodeId: "MDQ6VXNlcjIwMTQyMzM3",
    avatarUrl: "https://avatars.githubusercontent.com/u/20142337?v:4",
    name: "Gabriel Ramos",
    company: "Sami Saúde",
    blog: "linkedin.com/in/whosramoss/",
    location: "Vitória, Espirito Santo, Brazil",
    email: '',
    bio: "mobile software engineer",
    twitterUsername: "whosramoss",
    publicRepos: 33,
    followers: 14,
    following: 56,
    createdAt: "2016-06-25T15:00:51Z",
    updatedAt: "2022-08-04T03:37:06Z",
  );

  const mocklstRepositories = <GithubRepositoryModel>[
    GithubRepositoryModel(
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
    ),
    GithubRepositoryModel(
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
    ),
  ];

  setUpAll(() {
    repository = GithubRepository(datasource);
  });

  test('All instances injected', () {
    expect(datasource, isA<MockGithubDatasource>());
    expect(repository, isA<GithubRepository>());
  });

  group('[GithubRepository]', () {
    test('call FindProfile action', () async {
      when(datasource.findProfile(username))
          .thenAnswer((_) async => mockProfile);

      await repository.findProfile(username);

      verify(datasource.findProfile(username)).called(1);
    });

    test('check FindProfile action', () async {
      when(datasource.findProfile(username))
          .thenAnswer((_) async => mockProfile);

      var result = await repository.findProfile(username);

      expect(result, isNotNull);
      expect(result, isA<GithubProfileEntity>());
    });

    test('call FindRepositories action', () async {
      when(datasource.findRepositories(username))
          .thenAnswer((_) async => mocklstRepositories);

      await repository.findRepositories(username);

      verify(datasource.findRepositories(username)).called(1);
    });

    test('check FindRepositories action', () async {
      when(datasource.findRepositories(username))
          .thenAnswer((_) async => mocklstRepositories);

      var result = await repository.findRepositories(username);

      expect(result, isNotNull);
      expect(result, isA<List<GithubRepositoryEntity>>());
      expect(result.length, equals(2));
    });

    test('Return GithubError error type', () {
      when(datasource.findProfile(username))
          .thenThrow(GithubError(errorMessage: '', statusCode: 0));

      expect(
        () async => await datasource.findProfile(username),
        throwsA(isA<GithubError>()),
      );
    });
  });
}
