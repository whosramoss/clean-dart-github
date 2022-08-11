import '../entities/github_repository_entity.dart';
import '../entities/github_profile_entity.dart';

abstract class IGithubRepository {
  Future<GithubProfileEntity> findProfile(String username);
  Future<List<GithubRepositoryEntity>> findRepositories(String username);
  Future<List<GithubRepositoryEntity>> findStarredRepositories(String username);
}
