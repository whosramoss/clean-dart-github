import 'package:github_commons/module/domain/entities/github_repository_entity.dart';

abstract class IFindStarredRepositories {
  Future<List<GithubRepositoryEntity>> call(String username);
}
