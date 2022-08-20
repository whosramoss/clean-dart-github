import 'package:github_commons/main.dart';

class GithubRepository implements IGithubRepository {
  final IGithubDatasource _datasource;

  GithubRepository(this._datasource);

  @override
  Future<GithubProfileEntity> findProfile(String username) async {
    try {
      var value = await _datasource.findProfile(username);
      return value.toEntity();
    } catch (error, stacktrace) {
      throw _error(error, stacktrace);
    }
  }

  @override
  Future<List<GithubRepositoryEntity>> findRepositories(String username) async {
    try {
      var value = await _datasource.findRepositories(username);
      return value.map((v) => v.toEntity()).toList();
    } catch (error, stacktrace) {
      throw _error(error, stacktrace);
    }
  }

  GithubError _error(Object error, StackTrace? stacktrace) {
    if (error is DioError) {
      throw GithubError(
        statusCode: error.response?.statusCode ?? 0,
        exception: error.message,
        errorMessage: error.response?.statusMessage ?? 'Error no message',
      );
    }
    throw GithubError(
      statusCode: 0,
      exception: error,
      errorMessage: 'Internal error',
      stackTrace: stacktrace,
    );
  }
}
