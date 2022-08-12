import '../../../module/infra/models/github_repository_model.dart';
import '../../../module/infra/models/github_profile_model.dart';
import '../../../shared/utils/connection/dio_http_connection.dart';
import '../../infra/datasources/i_github_datasource.dart';

class GithubDatasource implements IGithubDatasource {
  final IDioHttpConnection _http;

  GithubDatasource(this._http);

  @override
  Future<GithubProfileModel> findProfile(String username) async {
    var response = await _http.get('users/$username');

    dynamic data = response.data;

    return GithubProfileModel.fromJson(data);
  }

  @override
  Future<List<GithubRepositoryModel>> findRepositories(String username) async {
    var response = await _http.get('users/$username/repos');

    List<dynamic> data = response.data;

    return data.map((v) => GithubRepositoryModel.fromJson(v)).toList();
  }
}
