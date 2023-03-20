import 'package:github_commons/module/domain/entities/github_profile_entity.dart';

abstract class IGetProfile {
  Future<GithubProfileEntity> call(String username);
}
