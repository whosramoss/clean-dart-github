import 'package:github_commons/module/domain/entities/github_profile_entity.dart';
import 'package:github_commons/module/domain/repositories/i_github_repository.dart';
import 'package:github_commons/module/domain/usecases/get_profile/i_get_profile.dart';

class GetProfile implements IGetProfile {
  final IGithubRepository _repository;

  const GetProfile(this._repository);

  @override
  Future<GithubProfileEntity> call(String username) async {
    return await _repository.getProfile(username);
  }
}
