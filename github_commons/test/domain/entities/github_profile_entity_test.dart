import 'package:flutter_test/flutter_test.dart';
import 'package:github_commons/module/domain/entities/github_profile_entity.dart';

void main() {
  const username = "whosramoss";
  const id = 20142337;
  const nodeId = "MDQ6VXNlcjIwMTQyMzM3";
  const avatarUrl = "https://avatars.githubusercontent.com/u/20142337?v=4";
  const name = "Gabriel Ramos";
  const company = "Sami Saúde";
  const blog = "linkedin.com/in/whosramoss/";
  const location = "Vitória, Espirito Santo, Brazil";
  const email = '';
  const bio = "mobile software engineer";
  const twitterUsername = "whosramoss";
  const publicRepos = 33;
  const followers = 14;
  const following = 56;
  const createdAt = "2016-06-25T15:00:51Z";
  const updatedAt = "2022-08-04T03:37:06Z";
  group('[GithubProfileEntity]', () {
    test('New instance with new parameters', () {
      const entity = GithubProfileEntity(
        id: id,
        nodeId: nodeId,
        name: name,
        company: company,
        username: username,
        avatarUrl: avatarUrl,
        blog: blog,
        location: location,
        email: email,
        bio: bio,
        twitterUsername: twitterUsername,
        publicRepos: publicRepos,
        followers: followers,
        following: following,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

      expect(entity, isA<GithubProfileEntity>());
      expect(entity.id, equals(id));
      expect(entity.nodeId, equals(nodeId));
      expect(entity.name, equals(name));
      expect(entity.company, equals(company));
      expect(entity.username, equals(username));
      expect(entity.avatarUrl, equals(avatarUrl));
      expect(entity.location, equals(location));
      expect(entity.email, equals(email));
      expect(entity.bio, equals(bio));
      expect(entity.twitterUsername, equals(twitterUsername));
      expect(entity.publicRepos, equals(publicRepos));
      expect(entity.followers, equals(followers));
      expect(entity.following, equals(following));
      expect(entity.createdAt, equals(createdAt));
      expect(entity.updatedAt, equals(updatedAt));
    });

    test('New instance with copied parameters', () {
      const entity = GithubProfileEntity(
        id: 0,
        nodeId: '',
        name: '',
        company: '',
        username: '',
        avatarUrl: '',
        blog: '',
        location: '',
        email: '',
        bio: '',
        twitterUsername: '',
        publicRepos: 0,
        followers: 0,
        following: 0,
        createdAt: '',
        updatedAt: '',
      );

      final newEntity = entity.copyWith(
        id: id,
        nodeId: nodeId,
        name: name,
        company: company,
        username: username,
        avatarUrl: avatarUrl,
        blog: blog,
        location: location,
        email: email,
        bio: bio,
        twitterUsername: twitterUsername,
        publicRepos: publicRepos,
        followers: followers,
        following: following,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );

      expect(newEntity, isA<GithubProfileEntity>());
      expect(newEntity.id, equals(id));
      expect(newEntity.nodeId, equals(nodeId));
      expect(newEntity.name, equals(name));
      expect(newEntity.company, equals(company));
      expect(newEntity.username, equals(username));
      expect(newEntity.avatarUrl, equals(avatarUrl));
      expect(newEntity.location, equals(location));
      expect(newEntity.email, equals(email));
      expect(newEntity.bio, equals(bio));
      expect(newEntity.twitterUsername, equals(twitterUsername));
      expect(newEntity.publicRepos, equals(publicRepos));
      expect(newEntity.followers, equals(followers));
      expect(newEntity.following, equals(following));
      expect(newEntity.createdAt, equals(createdAt));
      expect(newEntity.updatedAt, equals(updatedAt));
    });
  });
}
