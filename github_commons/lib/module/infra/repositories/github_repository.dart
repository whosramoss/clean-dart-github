import 'package:github_commons/module/domain/errors/github_errors.dart';
import 'package:github_commons/module/infra/datasources/i_github_datasource.dart';
import 'package:github_commons/shared/connection/base_error.dart';

import '../../domain/entities/github_repository_entity.dart';
import '../../domain/entities/github_profile_entity.dart';
import '../../domain/repositories/i_github_repository.dart';

class GithubRepository implements IGithubRepository {
  final IGithubDatasource _datasource;

  GithubRepository(this._datasource);

  @override
  Future<GithubProfileEntity> findProfile(String username) async {
    try {
      var value = await _datasource.findProfile(username);
      return value.toEntity();
    } on BaseError catch (_) {
      rethrow;
    } catch (error, stackTrace) {
      throw GithubDatasourceError(stackTrace: stackTrace, exception: error);
    }
  }

  @override
  Future<List<GithubRepositoryEntity>> findRepositories(String username) async {
    try {
      var value = await _datasource.findRepositories(username);
      return value.map((v) => v.toEntity()).toList();
    } on BaseError catch (_) {
      rethrow;
    } catch (error, stackTrace) {
      throw GithubDatasourceError(stackTrace: stackTrace, exception: error);
    }
  }
}
