import 'package:github_commons/module/domain/repositories/i_github_repository.dart';

import '../../entities/github_repository_entity.dart';
import 'i_find_starred_repositories.dart';

class FindStarredRepositories implements IFindStarredRepositories {
  final IGithubRepository _repository;

  FindStarredRepositories(this._repository);

  @override
  Future<List<GithubRepositoryEntity>> call(String username) {
    return _repository.findStarredRepositories(username);
  }
}
