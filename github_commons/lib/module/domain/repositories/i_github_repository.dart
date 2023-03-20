import '../entities/github_repository_entity.dart';
import '../entities/github_profile_entity.dart';

abstract class IGithubRepository {
  Future<GithubProfileEntity> getProfile(String username);
  Future<List<GithubRepositoryEntity>> getRepositories(String username);
}
