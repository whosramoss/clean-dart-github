import 'package:flutter_test/flutter_test.dart';
import 'package:github_commons/module/domain/entities/github_profile_entity.dart';
import 'package:github_commons/module/infra/models/github_profile_model.dart';

void main() {
  const mockModel = GithubProfileModel(
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

  const mockEntity = GithubProfileEntity(
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

  test('model to entity', () {
    var entity = mockModel.toEntity();

    expect(entity, isA<GithubProfileEntity>());
    expect(entity, equals(mockEntity));
  });

  test('entity to model', () {
    var model = GithubProfileModel.fromEntity(mockEntity);

    expect(model, isA<GithubProfileModel>());
    expect(model, equals(mockModel));
  });
}
