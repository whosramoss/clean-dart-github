import 'package:github_commons/main.dart';

abstract class GithubState extends Equatable {
  const GithubState();

  @override
  List<Object> get props => [];
}

class InitialState extends GithubState {}

class LoadingState extends GithubState {}

class SuccessState extends GithubState {
  final GithubProfileEntity profile;
  final List<GithubRepositoryEntity> lstRepositories;
  final List<GithubLanguageEntity> lstLanguages;

  const SuccessState({
    required this.profile,
    required this.lstRepositories,
    required this.lstLanguages,
  });
  @override
  String toString() =>
      'SuccessState { profile: $profile, lstRepositories: $lstRepositories , lstLanguages: $lstLanguages  }';
}

class ErrorState extends GithubState {
  final GithubError? error;
  const ErrorState({this.error});

  @override
  String toString() => 'ErrorState { error: $error }';
}

class UsernameStateEmpty extends GithubState {}

class UsernameStateCompleted extends GithubState {
  final String username;
  const UsernameStateCompleted({required this.username});

  @override
  List<Object> get props => [username];

  @override
  String toString() => 'UsernameStateCompleted { username: $username }';
}
