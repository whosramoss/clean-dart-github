import '../../../module/infra/models/github_profile_model.dart';
import '../../../module/infra/models/github_repository_model.dart';

abstract class IGithubDatasource {
  Future<GithubProfileModel> getProfile(String username);
  Future<List<GithubRepositoryModel>> getRepositories(String username);
}
