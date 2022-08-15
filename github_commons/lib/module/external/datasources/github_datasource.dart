import 'package:dio/dio.dart';
import '../../../module/infra/models/github_repository_model.dart';
import '../../../module/infra/models/github_profile_model.dart';
import '../../infra/datasources/i_github_datasource.dart';

class GithubDatasource implements IGithubDatasource {
  final Dio _dio;

  GithubDatasource(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: 'https://api.github.com/',
      receiveTimeout: const Duration(seconds: 30).inMilliseconds,
    );
  }

  @override
  Future<GithubProfileModel> findProfile(String username) async {
    var response = await _dio.get('users/$username');
    dynamic data = response.data;
    // dynamic data = jsonDecode(mockprofile);

    return GithubProfileModel.fromJson(data);
  }

  @override
  Future<List<GithubRepositoryModel>> findRepositories(String username) async {
    var response = await _dio.get('users/$username/repos');
    List<dynamic> data = response.data;
    // List<dynamic> data = jsonDecode(mockrepositories);
    return data.map((v) => GithubRepositoryModel.fromJson(v)).toList();
  }
}
