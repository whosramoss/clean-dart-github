import 'package:github_commons/main.dart';

abstract class GithubInheritedAction {
  Future<void> openRepostory(String value);
  Future<GithubProfileEntity> getProfile(String username);
  Future<List<GithubRepositoryEntity>> getRepositories(String username);
  List<GithubLanguageEntity> getLanguages(
      List<GithubRepositoryEntity> repositories);
}

class GithubAction implements GithubInheritedAction {
  // late final Dio dio;
  // late final UrlOpen _urlOpen;
  // // late final IFindProfile _findProfile;
  // late final IFindRepositories _findRepositories;
  // late final IFindLanguages _findLanguages;

  @override
  Future<void> openRepostory(String value) async {
    final UrlOpen urlOpen = UrlOpen();
    await urlOpen.openUrl(value);
  }

  @override
  Future<GithubProfileEntity> getProfile(String username) async {
    final IFindProfile findProfile = FindProfile(instances);
    return await findProfile(username);
  }

  @override
  Future<List<GithubRepositoryEntity>> getRepositories(String username) async {
    final IFindRepositories findRepositories = FindRepositories(instances);
    return await findRepositories(username);
  }

  @override
  List<GithubLanguageEntity> getLanguages(
      List<GithubRepositoryEntity> repositories) {
    return FindLanguages().call(repositories);
  }

  get instances => GithubRepository(GithubDatasource(Dio()));
}
