import 'package:github_commons/module/domain/repositories/i_github_repository.dart';
import 'package:github_commons/module/domain/usecases/get_repositories/i_get_repositories.dart';

import '../../entities/github_repository_entity.dart';

class GetRepositories implements IGetRepositories {
  final IGithubRepository _repository;

  const GetRepositories(this._repository);

  @override
  Future<List<GithubRepositoryEntity>> call(String username) async {
    return await _repository.getRepositories(username);
  }
}
