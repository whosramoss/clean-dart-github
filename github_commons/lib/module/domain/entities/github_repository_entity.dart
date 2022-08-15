import 'package:equatable/equatable.dart';

class GithubRepositoryEntity extends Equatable {
  final int id;
  final String nodeId;
  final String name;
  final String fullName;
  final String htmlUrl;
  final bool fork;
  final String description;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? pushedAt;
  final List<String> topics;
  final String language;

  const GithubRepositoryEntity({
    this.id = 0,
    this.nodeId = '',
    this.name = '',
    this.fullName = '',
    this.htmlUrl = '',
    this.fork = false,
    this.description = '',
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.topics = const <String>[],
    this.language = '',
  });

  GithubRepositoryEntity copyWith({
    int? id,
    String? nodeId,
    String? name,
    String? fullName,
    String? htmlUrl,
    bool? fork,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? pushedAt,
    List<String>? topics,
    String? language,
  }) {
    return GithubRepositoryEntity(
      id: id ?? this.id,
      nodeId: nodeId ?? this.nodeId,
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      fork: fork ?? this.fork,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      pushedAt: pushedAt ?? this.pushedAt,
      topics: topics ?? this.topics,
      language: language ?? this.language,
    );
  }

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
