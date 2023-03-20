import 'package:flutter/foundation.dart';
import 'package:github_commons/main.dart';

import 'package:mobx/mobx.dart';

part 'github_store.g.dart';

class GithubStore = GithubStoreBase with _$GithubStore;

abstract class GithubStoreBase with Store {
  final UrlOpen _urlOpen;
  final IGetProfile _getProfile;
  final IGetRepositories _getRepositories;
  final IGetLanguages _getLanguages;

  GithubStoreBase(
    this._urlOpen,
    this._getProfile,
    this._getRepositories,
    this._getLanguages,
  );

  @observable
  GithubError? _error;
  GithubError? get error => _error;
  bool get haveError => _error != null;
  @action
  void setError(GithubError? value) => _error = value;

  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  @action
  void setLoading(bool value) => _isLoading = value;

  @observable
  String _username = '';
  String get username => _username;
  @action
  void setUsername(String value) => _username = value;

  @observable
  GithubProfileEntity _profile = GithubProfileEntity.empty;
  GithubProfileEntity get profile => _profile;
  @action
  void setProfile(GithubProfileEntity value) => _profile = value;

  @observable
  List<GithubRepositoryEntity> _lstRepositories = [];
  List<GithubRepositoryEntity> get lstRepositories => _lstRepositories;
  @action
  void setRepositoryList(List<GithubRepositoryEntity> value) => _lstRepositories = value;

  @observable
  List<GithubLanguageEntity> _lstLanguages = [];
  List<GithubLanguageEntity> get lstLanguages => _lstLanguages;
  @action
  void setLanguageList(List<GithubLanguageEntity> value) => _lstLanguages = value;

  Future<void> setGithubData() async {
    try {
      setError(null);
      setLoading(true);
      GithubProfileEntity profile = await _getProfile(username);
      setProfile(profile);
      List<GithubRepositoryEntity> lstRepositories = await _getRepositories(username);
      setRepositoryList(lstRepositories);
      List<GithubLanguageEntity> lstLanguages = _getLanguages(lstRepositories);
      setLanguageList(lstLanguages);
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
