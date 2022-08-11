class GithubRepositoryEntity {
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
    required this.topics,
    this.language = '',
  });

  bool get isValid => id != 0;
}
