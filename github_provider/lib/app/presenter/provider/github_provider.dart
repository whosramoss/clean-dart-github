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

  List<GithubRepositoryEntity> _lstRepositories = <GithubRepositoryEntity>[];
  List<GithubRepositoryEntity> get lstRepositories => _lstRepositories;

  List<GithubLanguageEntity> _lstLanguages = <GithubLanguageEntity>[];
  List<GithubLanguageEntity> get lstLanguages => _lstLanguages;

  Future<void> setGithubData() async {
    try {
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
