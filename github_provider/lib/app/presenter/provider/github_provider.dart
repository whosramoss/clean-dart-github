import 'package:flutter/foundation.dart';
import 'package:github_commons/main.dart';

class GithubProvider with ChangeNotifier {
  final Dio dio;
  final GithubDatasource datasource;
  final GithubRepository repository;
  final FindProfile findProfile;
  final FindRepositories findRepositories;
  final FindLanguages findLanguages;
  final UrlOpen urlOpen;

  GithubProvider(
    this.dio,
    this.datasource,
    this.repository,
    this.findProfile,
    this.findRepositories,
    this.findLanguages,
    this.urlOpen,
  );

  GithubError? _error;
  GithubError? get error => _error;
  bool get hasError => _error != null;
  void setError(GithubError? value) {
    _error = value;
    notifyListeners();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String _username = '';
  String get username => _username;
  void setUsername(String value) {
    _username = value;
    notifyListeners();
  }

  GithubProfileEntity _profile = const GithubProfileEntity();
  GithubProfileEntity get profile => _profile;
  void setProfile(GithubProfileEntity value) {
    _profile = value;
    notifyListeners();
  }

  List<GithubRepositoryEntity> _lstRepositories = <GithubRepositoryEntity>[];
  List<GithubRepositoryEntity> get lstRepositories => _lstRepositories;
  void setLstRepositories(List<GithubRepositoryEntity> value) {
    _lstRepositories = value;
    notifyListeners();
  }

  List<GithubLanguageEntity> _lstLanguages = <GithubLanguageEntity>[];
  List<GithubLanguageEntity> get lstLanguages => _lstLanguages;
  void setLstLanguages(List<GithubLanguageEntity> value) {
    _lstLanguages = value;
    notifyListeners();
  }

  Future<void> setGithubData() async {
    try {
      debugPrint('provider');
      setError(null);
      setLoading(true);

      _profile = await findProfile(username);
      _lstRepositories = await findRepositories(username);
      _lstLanguages = findLanguages(lstRepositories);

      notifyListeners();
    } on GithubError catch (error) {
      debugPrint(error.toString());
      setError(error);
    } finally {
      setLoading(false);
    }
  }

  Future<void> openUrl(String link) async {
    await urlOpen.openUrl(link);
  }
}
