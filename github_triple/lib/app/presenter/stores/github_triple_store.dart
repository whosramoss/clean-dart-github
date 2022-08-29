import 'package:flutter/foundation.dart';
import 'package:github_commons/main.dart';

import 'package:flutter_triple/flutter_triple.dart';

class GithubTripleStore extends NotifierStore<GithubError, GithubResultEntity> {
  final UrlOpen _urlOpen;
  final IFindProfile _findProfile;
  final IFindRepositories _findRepositories;
  final IFindLanguages _findLanguages;

  GithubTripleStore(
    this._urlOpen,
    this._findProfile,
    this._findRepositories,
    this._findLanguages,
  ) : super(const GithubResultEntity());

  void setUsername(String value) {
    update(GithubResultEntity(
      username: value,
      profile: const GithubProfileEntity(),
      lstRepositories: const [],
      lstLanguages: const [],
    ));
  }

  Future<void> setGithubData() async {
    try {
      setError(GithubError(errorMessage: '', statusCode: 0));
      setLoading(true);

      final username = state.username;
      final profile = await _findProfile(username);
      final lstRepositories = await _findRepositories(username);
      final lstLanguages = _findLanguages(lstRepositories);
      final value = state.copyWith(
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
