import 'package:equatable/equatable.dart';

import 'github_language_entity.dart';
import 'github_profile_entity.dart';
import 'github_repository_entity.dart';

class GithubResultEntity extends Equatable {
  final String username;
  final GithubProfileEntity profile;
  final List<GithubRepositoryEntity> lstRepositories;
  final List<GithubLanguageEntity> lstLanguages;

  const GithubResultEntity({
    required this.username,
    required this.profile,
    required this.lstRepositories,
    required this.lstLanguages,
  });

  static GithubResultEntity get empty => GithubResultEntity(
     username:'',
    profile:GithubProfileEntity.empty,
    lstRepositories:const [],
    lstLanguages:const [],
  );

  GithubResultEntity copyWith({
    String? username,
    GithubProfileEntity? profile,
    List<GithubRepositoryEntity>? lstRepositories,
    List<GithubLanguageEntity>? lstLanguages,
  }) {
    return GithubResultEntity(
      username: username ?? this.username,
      profile: profile ?? this.profile,
      lstRepositories: lstRepositories ?? this.lstRepositories,
      lstLanguages: lstLanguages ?? this.lstLanguages,
    );
  }

  @override
  List<Object?> get props => [username, profile, lstRepositories, lstLanguages];
}
