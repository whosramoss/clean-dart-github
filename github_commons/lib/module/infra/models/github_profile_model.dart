import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/github_profile_entity.dart';

part 'github_profile_model.g.dart';

@JsonSerializable()
class GithubProfileModel {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;

  @JsonKey(name: 'node_id', defaultValue: '')
  final String nodeId;

  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @JsonKey(name: 'company', defaultValue: '')
  final String company;

  @JsonKey(name: 'login', defaultValue: '')
  final String username;

  @JsonKey(name: 'avatar_url', defaultValue: '')
  final String avatarUrl;

  @JsonKey(name: 'blog', defaultValue: '')
  final String blog;

  @JsonKey(name: 'location', defaultValue: '')
  final String location;

  @JsonKey(name: 'email', defaultValue: '')
  final String email;

  @JsonKey(name: 'twitter_username', defaultValue: '')
  final String twitterUsername;

  @JsonKey(name: 'bio', defaultValue: '')
  final String bio;

  @JsonKey(name: 'public_repos', defaultValue: 0)
  final int publicRepos;

  @JsonKey(name: 'following', defaultValue: 0)
  final int following;

  @JsonKey(name: 'followers', defaultValue: 0)
  final int followers;

  @JsonKey(name: 'created_at', defaultValue: '')
  final String? createdAt;

  @JsonKey(name: 'updated_at', defaultValue: '')
  final String? updatedAt;

  const GithubProfileModel({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.company,
    required this.username,
    required this.avatarUrl,
    required this.blog,
    required this.location,
    required this.email,
    required this.twitterUsername,
    required this.publicRepos,
    required this.bio,
    required this.following,
    required this.followers,
    required this.createdAt,
    required this.updatedAt,
  });

  factory GithubProfileModel.fromEntity(GithubProfileEntity value) {
    return GithubProfileModel(
      id: value.id,
      nodeId: value.nodeId,
      name: value.name,
      company: value.company,
      username: value.username,
      avatarUrl: value.avatarUrl,
      blog: value.blog,
      location: value.location,
      email: value.email,
      twitterUsername: value.twitterUsername,
      publicRepos: value.publicRepos,
      bio: value.bio,
      following: value.following,
      followers: value.followers,
      createdAt: value.createdAt,
      updatedAt: value.updatedAt,
    );
  }

  GithubProfileEntity toEntity() {
    return GithubProfileEntity(
      id: id,
      nodeId: nodeId,
      name: name,
      company: company,
      username: username,
      avatarUrl: avatarUrl,
      blog: blog,
      location: location,
      email: email,
      twitterUsername: twitterUsername,
      publicRepos: publicRepos,
      bio: bio,
      following: following,
      followers: followers,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory GithubProfileModel.fromJson(Map<String, dynamic> json) =>
      _$GithubProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$GithubProfileModelToJson(this);

  factory GithubProfileModel.fromString(String json) =>
      GithubProfileModel.fromJson(jsonDecode(json));

  String toJsonString() => jsonEncode(toJson());
}
