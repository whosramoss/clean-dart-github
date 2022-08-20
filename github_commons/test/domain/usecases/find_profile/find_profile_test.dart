import 'package:flutter_test/flutter_test.dart';
import 'package:github_commons/module/domain/entities/github_profile_entity.dart';
import 'package:github_commons/module/domain/usecases/find_profile/find_profile.dart';
import 'package:github_commons/module/domain/usecases/find_profile/i_find_profile.dart';
import 'package:github_commons/module/infra/repositories/github_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'find_profile_test.mocks.dart';

@GenerateMocks([GithubRepository])
void main() {
  final repository = MockGithubRepository();

  late IFindProfile findProfile;

  const entity = GithubProfileEntity(
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

  setUpAll(() {
    findProfile = FindProfile(repository);
  });

  group("[FindProfile]", () {
    test('All instances injected', () {
      expect(repository, isA<MockGithubRepository>());
      expect(findProfile, isA<IFindProfile>());
    });

    test('Return a GithubProfileEntity', () async {
      const username = "whosramoss";

      clearInteractions(repository);

      when(repository.findProfile(username)).thenAnswer((_) async => entity);

      var result = await findProfile(username);

      expect(result, isNotNull);
      expect(result, isA<GithubProfileEntity>());
    });
  });
}
