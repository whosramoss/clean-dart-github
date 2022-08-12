class GithubProfileEntity {
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

  bool get isValid => id != 0;
}
