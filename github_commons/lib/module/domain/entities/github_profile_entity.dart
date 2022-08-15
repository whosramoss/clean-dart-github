import 'package:equatable/equatable.dart';

class GithubProfileEntity extends Equatable {
  final int id;
  final String nodeId;
  final String name;
  final String company;
  final String username;
  final String avatarUrl;
  final String blog;
  final String location;
  final String email;
  final String bio;
  final String twitterUsername;
  final int publicRepos;
  final int followers;
  final int following;
  final String? createdAt;
  final String? updatedAt;

  const GithubProfileEntity({
    this.id = 0,
    this.nodeId = '',
    this.name = '',
    this.company = '',
    this.username = '',
    this.avatarUrl = '',
    this.blog = '',
    this.location = '',
    this.email = '',
    this.bio = '',
    this.twitterUsername = '',
    this.publicRepos = 0,
    this.followers = 0,
    this.following = 0,
    this.createdAt,
    this.updatedAt,
  });

  GithubProfileEntity copyWith({
    int? id,
    String? nodeId,
    String? name,
    String? company,
    String? username,
    String? avatarUrl,
    String? blog,
    String? location,
    String? email,
    String? bio,
    String? twitterUsername,
    int? publicRepos,
    int? followers,
    int? following,
    String? createdAt,
    String? updatedAt,
  }) {
    return GithubProfileEntity(
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      name: name ?? this.name,
      company: company ?? this.company,
      username: username ?? this.username,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      blog: blog ?? this.blog,
      location: location ?? this.location,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      twitterUsername: twitterUsername ?? this.twitterUsername,
      publicRepos: publicRepos ?? this.publicRepos,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        nodeId,
        name,
        company,
        username,
        avatarUrl,
        blog,
        location,
        email,
        bio,
        twitterUsername,
        publicRepos,
        followers,
        following,
        createdAt,
        updatedAt,
      ];
}
