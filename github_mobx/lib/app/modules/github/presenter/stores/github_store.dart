import 'package:flutter/foundation.dart';
import 'package:github_commons/main.dart';

import '../../../../shared/exports.dart';

part 'github_store.g.dart';

class GithubStore = GithubStoreBase with _$GithubStore;

abstract class GithubStoreBase with Store {
  final IUrlOpen _urlOpen;
  final IFindProfile _findProfile;
  final IFindRepositories _findRepositories;
  final IFindLanguages _findLanguages;

  GithubStoreBase(
    this._urlOpen,
    this._findProfile,
    this._findRepositories,
    this._findLanguages,
  );

  @observable
  GithubError? _error;
  GithubError? get error => _error;
  bool get haveError => _error != null;

  @observable
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @observable
  String _username = '';
  String get username => _username;

  @observable
  GithubProfileEntity _profile = const GithubProfileEntity();
  GithubProfileEntity get profile => _profile;

  @observable
  List<GithubRepositoryEntity> _lstRepositories = <GithubRepositoryEntity>[];
  List<GithubRepositoryEntity> get lstRepositories => _lstRepositories;

  @observable
  List<GithubLanguageEntity> _lstLanguages = <GithubLanguageEntity>[];
  List<GithubLanguageEntity> get lstLanguages => _lstLanguages;

  @action
  void setUsername(String value) => _username = value;

  @action
  Future<void> setGithubData() async {
    try {
      _error = null;
      _isLoading = true;

      _profile = await _findProfile(username);
      _lstRepositories = await _findRepositories(username);
      _lstLanguages = _findLanguages(lstRepositories);

      openProfilePage();
    } on GithubError catch (error) {
      debugPrint(error.toString());
      _error = error;
    } finally {
      _isLoading = false;
    }
  }

  Future<void> openUrl(String link) async {
    await _urlOpen.launchUrl(link);
  }

  void openProfilePage() {
    Modular.to.pushNamed(GithubRoutes.profile);
  }
}
