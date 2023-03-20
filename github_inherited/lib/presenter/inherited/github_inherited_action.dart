import 'package:github_commons/main.dart';

abstract class GithubInheritedAction {
  Future<void> openRepostory(String value);
  Future<GithubProfileEntity> getProfile(String username);
  Future<List<GithubRepositoryEntity>> getRepositories(String username);
  List<GithubLanguageEntity> getLanguages(List<GithubRepositoryEntity> repositories);
}

class GithubAction implements GithubInheritedAction {
  IGithubRepository get instances => GithubRepository(GithubDatasource(Dio()));

  @override
  Future<void> openRepostory(String value) async {
    final UrlOpen urlOpen = UrlOpen();
    await urlOpen.openUrl(value);
  }

  @override
  Future<GithubProfileEntity> getProfile(String username) async {
    final IGetProfile getProfile = GetProfile(instances);
    return await getProfile(username);
  }

  @override
  Future<List<GithubRepositoryEntity>> getRepositories(String username) async {
    final IGetRepositories getRepositories = GetRepositories(instances);
    return await getRepositories(username);
  }

  @override
  List<GithubLanguageEntity> getLanguages(List<GithubRepositoryEntity> repositories) {
    final IGetLanguages getLanguages = GetLanguages();
    return getLanguages(repositories);
  }
}
