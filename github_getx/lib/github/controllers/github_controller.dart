import 'package:flutter/foundation.dart';
import 'package:github_commons/main.dart';

import '../utils/exports.dart';
import '../utils/routes.dart';

class GithubController extends GetxController {
  final IFindProfile _findProfile;
  final IFindRepositories _findRepositories;
  final IFindStatsLanguage _findStatsLanguage;
  final IUrlOpen _urlOpen;

  GithubController(
    this._findProfile,
    this._findRepositories,
    this._findStatsLanguage,
    this._urlOpen,
  );

  final isLoading = false.obs;

  final username = ''.obs;

  final profile = const GithubProfileEntity().obs;

  final lstRepositories = <GithubRepositoryEntity>[].obs;

  final lstLanguages = <GithubLanguageEntity>[].obs;

  var error = GithubError(errorMessage: '', statusCode: 0).obs;

  void setUsername(String value) => username.value = value;

  Future<void> setGithubData() async {
    try {
      error.value = GithubError(errorMessage: '', statusCode: 0);
      isLoading.value = true;

      profile.value = await _findProfile(username.value);
      lstRepositories.value = await _findRepositories(username.value);
      lstLanguages.value = _findStatsLanguage(lstRepositories);

      openProfilePage();
    } on GithubError catch (e) {
      debugPrint(error.toString());
      error.value = e;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> openUrl(String link) async {
    await _urlOpen.launchUrl(link);
  }

  void openProfilePage() {
    Get.toNamed(Routes.profile);
  }
}
