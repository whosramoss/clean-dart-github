import 'package:flutter_test/flutter_test.dart';
import 'package:github_commons/module/domain/entities/github_profile_entity.dart';

void main() {
  const mock = GithubProfileEntity(
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

  test('New instance with new parameters', () {
    const entity = mock;
    expect(entity, isA<GithubProfileEntity>());
    expect(entity, equals(mock));
  });

  test('New instance with copied parameters', () {
    final entity = GithubProfileEntity.empty.copyWith(username: "whosramoss");
    expect(entity, isA<GithubProfileEntity>());
    expect(entity.username, equals(mock.username));
  });
}
