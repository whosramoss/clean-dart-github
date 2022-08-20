// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubProfileModel _$GithubProfileModelFromJson(Map<String, dynamic> json) =>
    GithubProfileModel(
      id: json['id'] as int? ?? 0,
      nodeId: json['node_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      company: json['company'] as String? ?? '',
      username: json['login'] as String? ?? '',
      avatarUrl: json['avatar_url'] as String? ?? '',
      blog: json['blog'] as String? ?? '',
      location: json['location'] as String? ?? '',
      email: json['email'] as String? ?? '',
      twitterUsername: json['twitter_username'] as String? ?? '',
      publicRepos: json['public_repos'] as int? ?? 0,
      bio: json['bio'] as String? ?? '',
      following: json['following'] as int? ?? 0,
      followers: json['followers'] as int? ?? 0,
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
    );

Map<String, dynamic> _$GithubProfileModelToJson(GithubProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'name': instance.name,
      'company': instance.company,
      'login': instance.username,
      'avatar_url': instance.avatarUrl,
      'blog': instance.blog,
      'location': instance.location,
      'email': instance.email,
      'twitter_username': instance.twitterUsername,
      'bio': instance.bio,
      'public_repos': instance.publicRepos,
      'following': instance.following,
      'followers': instance.followers,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
