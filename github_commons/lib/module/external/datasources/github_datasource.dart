import 'package:dio/dio.dart';
import '../../../module/infra/models/github_repository_model.dart';
import '../../../module/infra/models/github_profile_model.dart';
import '../../infra/datasources/i_github_datasource.dart';

class GithubDatasource implements IGithubDatasource {
  final Dio _dio;

  GithubDatasource(this._dio) {
    _dio.options = BaseOptions(baseUrl: 'https://api.github.com/');
  }

  @override
  Future<GithubProfileModel> getProfile(String username) async {
    var response = await _dio.get('users/$username');

    dynamic data = response.data; // GithubDataTest.getProfile();

    return GithubProfileModel.fromJson(data);
  }

  @override
  Future<List<GithubRepositoryModel>> getRepositories(String username) async {
    var response = await _dio.get('users/$username/repos');

    List<dynamic> data = response.data; //GithubDataTest.getRepositories();

    return data.map((v) => GithubRepositoryModel.fromJson(v)).toList();
  }
}
