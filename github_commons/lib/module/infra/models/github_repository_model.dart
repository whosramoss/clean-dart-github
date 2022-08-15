import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:github_commons/module/domain/entities/github_repository_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_repository_model.g.dart';

@JsonSerializable()
class GithubRepositoryModel extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;

  @JsonKey(name: 'node_id', defaultValue: '')
  final String nodeId;

  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @JsonKey(name: 'full_name', defaultValue: '')
  final String fullName;

  @JsonKey(name: 'html_url', defaultValue: '')
  final String htmlUrl;

  @JsonKey(name: 'fork', defaultValue: false)
  final bool fork;

  @JsonKey(name: 'description', defaultValue: '')
  final String description;

  @JsonKey(name: 'created_at', defaultValue: '')
  final String? createdAt;

  @JsonKey(name: 'updated_at', defaultValue: '')
  final String? updatedAt;

  @JsonKey(name: 'pushed_at', defaultValue: '')
  final String? pushedAt;

  @JsonKey(name: 'language', defaultValue: '')
  final String language;

  @JsonKey(name: 'topics', defaultValue: [])
  final List<String> topics;

  const GithubRepositoryModel({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.htmlUrl,
    required this.fork,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
    required this.language,
    required this.topics,
  });

  factory GithubRepositoryModel.fromEntity(GithubRepositoryEntity value) {
    return GithubRepositoryModel(
      id: value.id,
      nodeId: value.nodeId,
      name: value.name,
      fullName: value.fullName,
      htmlUrl: value.htmlUrl,
      fork: value.fork,
      description: value.description,
      createdAt: value.createdAt?.toIso8601String(),
      updatedAt: value.updatedAt?.toIso8601String(),
      pushedAt: value.pushedAt?.toIso8601String(),
      language: value.language,
      topics: value.topics,
    );
  }

  GithubRepositoryEntity toEntity() {
    return GithubRepositoryEntity(
      id: id,
      nodeId: nodeId,
      name: name,
      fullName: fullName,
      htmlUrl: htmlUrl,
      fork: fork,
      description: description,
      createdAt: createdAt != null ? DateTime.parse(createdAt!) : null,
      updatedAt: updatedAt != null ? DateTime.parse(updatedAt!) : null,
      pushedAt: pushedAt != null ? DateTime.parse(pushedAt!) : null,
      language: language,
      topics: topics,
    );
  }

  factory GithubRepositoryModel.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$GithubRepositoryModelToJson(this);

  factory GithubRepositoryModel.fromString(String json) =>
      GithubRepositoryModel.fromJson(jsonDecode(json));

  String toJsonString() => jsonEncode(toJson());

  @override
  List<Object?> get props => [
        id,
        nodeId,
        name,
        fullName,
        htmlUrl,
        fork,
        description,
        createdAt,
        updatedAt,
        pushedAt,
        topics,
        language,
      ];
}
