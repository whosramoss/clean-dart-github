import 'package:flutter/foundation.dart';
import 'package:github_commons/main.dart';

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
  void setProfile(GithubProfileEntity value) => _profile = value;

  @action
  void setLstRepositories(List<GithubRepositoryEntity> value) =>
      _lstRepositories = value;

  @action
  void setLstLanguages(List<GithubLanguageEntity> value) =>
      _lstLanguages = value;

  Future<void> getGithubData() async {
    try {
      setError(null);
      setLoading(true);

      var profile = await _findProfile.call(username);
      setProfile(profile);
      debugPrint('profile setted');
      var repositories = await _findRepositories.call(username);
      setLstRepositories(repositories);
      debugPrint('repositories setted');
      var languages = _findStatsLanguage.call(repositories);
      setLstLanguages(languages);
      debugPrint('languages setted');
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
}
