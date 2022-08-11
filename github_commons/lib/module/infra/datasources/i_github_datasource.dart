import '../../../module/infra/models/github_profile_model.dart';
import '../../../module/infra/models/github_repository_model.dart';

abstract class IGithubDatasource {
  Future<GithubProfileModel> findProfile(String username);
  Future<List<GithubRepositoryModel>> findRepositories(String username);
  Future<List<GithubRepositoryModel>> findStarredRepositories(String username);
}
