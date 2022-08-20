import 'package:github_commons/module/domain/entities/github_profile_entity.dart';
import 'package:github_commons/module/domain/repositories/i_github_repository.dart';
import 'package:github_commons/module/domain/usecases/find_profile/i_find_profile.dart';

class FindProfile implements IFindProfile {
  final IGithubRepository _repository;

  FindProfile(this._repository);

  @override
  Future<GithubProfileEntity> call(String username) {
    return _repository.findProfile(username);
  }
}
