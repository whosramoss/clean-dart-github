// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repository_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubRepositoryModel _$GithubRepositoryModelFromJson(
        Map<String, dynamic> json) =>
    GithubRepositoryModel(
      id: json['id'] as int? ?? 0,
      nodeId: json['node_id'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      htmlUrl: json['html_url'] as String? ?? '',
      fork: json['fork'] as bool? ?? false,
      description: json['description'] as String? ?? '',
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      pushedAt: json['pushed_at'] as String? ?? '',
      language: json['language'] as String? ?? '',
      topics: (json['topics'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$GithubRepositoryModelToJson(
        GithubRepositoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'full_name': instance.fullName,
      'html_url': instance.htmlUrl,
      'fork': instance.fork,
      'description': instance.description,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'pushed_at': instance.pushedAt,
      'language': instance.language,
      'topics': instance.topics,
    };
