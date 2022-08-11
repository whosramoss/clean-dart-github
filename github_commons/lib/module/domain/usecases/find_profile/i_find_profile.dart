import 'package:github_commons/module/domain/entities/github_profile_entity.dart';

abstract class IFindProfile {
  Future<GithubProfileEntity> call(String username);
}
