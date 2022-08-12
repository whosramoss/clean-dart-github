import 'package:flutter/foundation.dart';
import 'package:github_commons/main.dart';
import 'package:github_mobx/app/shared/routes.dart';

part 'github_store.g.dart';

class GithubStore = GithubStoreBase with _$GithubStore;

abstract class GithubStoreBase with Store {
  final IUrlOpen _urlOpen;
  final IFindProfile _findProfile;
  final IFindRepositories _findRepositories;
  final IFindStatsLanguage _findStatsLanguage;

  GithubStoreBase(
    this._urlOpen,
    this._findProfile,
    this._findRepositories,
    this._findStatsLanguage,
  );

  @observable
  BaseError? _error;
  BaseError? get error => _error;
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
  void setLoading(bool value) => _isLoading = value;

  @action
  void setError(BaseError? value) => _error = value;

  @action
  void setUsername(String value) => _username = value;

  @action
  Future<void> setGithubData() async {
    _profile = await _findProfile.call(username);
    _lstRepositories = await _findRepositories.call(username);
    _lstLanguages = _findStatsLanguage.call(lstRepositories);
  }

  Future<void> getGithubData() async {
    try {
      setError(null);
      setLoading(true);
      await setGithubData();
      openProfilePage();
    } on BaseError catch (error) {
      debugPrint(error.toString());
      setError(error);
    } finally {
      setLoading(false);
    }
  }

  Future<void> openUrl(String link) async {
    await _urlOpen.launchUrl(link);
  }

  void openProfilePage() {
    Modular.to.pushNamed(Routes.profile);
  }
}
