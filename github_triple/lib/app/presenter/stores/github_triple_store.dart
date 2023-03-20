import 'package:flutter/foundation.dart';
import 'package:github_commons/main.dart';

import 'package:flutter_triple/flutter_triple.dart';

class GithubTripleStore extends NotifierStore<GithubError, GithubResultEntity> {
  final UrlOpen _urlOpen;
  final IGetProfile _getProfile;
  final IGetRepositories _getRepositories;
  final IGetLanguages _getLanguages;

  GithubTripleStore(
    this._urlOpen,
    this._getProfile,
    this._getRepositories,
    this._getLanguages,
  ) : super(GithubResultEntity.empty);

  void setUsername(String value) {
    GithubResultEntity result = GithubResultEntity.empty.copyWith(
      username: value,
    );
    update(result);
  }

  Future<void> setGithubData() async {
    try {
      setError(GithubError.empty);
      setLoading(true);

      GithubProfileEntity profile = await _getProfile(state.username);
      List<GithubRepositoryEntity> lstRepositories = await _getRepositories(state.username);
      List<GithubLanguageEntity> lstLanguages = _getLanguages(lstRepositories);
      GithubResultEntity value = state.copyWith(
        profile: profile,
        lstRepositories: lstRepositories,
        lstLanguages: lstLanguages,
      );

      update(value);

      openProfilePage();
    } on GithubError catch (error) {
      debugPrint(error.toString());
      setError(error);
    } finally {
      setLoading(false);
    }
  }

  Future<void> openUrl(String link) async {
    await _urlOpen.openUrl(link);
  }

  void openProfilePage() {
    Modular.to.pushNamed(GithubRoutes.profile);
  }
}
