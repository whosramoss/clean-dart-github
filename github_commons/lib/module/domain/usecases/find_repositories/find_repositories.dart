import 'package:github_commons/module/domain/repositories/i_github_repository.dart';
import 'package:github_commons/module/domain/usecases/find_repositories/i_find_repositories.dart';

import '../../entities/github_repository_entity.dart';

class FindRepositories implements IFindRepositories {
  final IGithubRepository _repository;

  FindRepositories(this._repository);

  @override
  Future<List<GithubRepositoryEntity>> call(String username) {
    return _repository.findRepositories(username);
  }
}
