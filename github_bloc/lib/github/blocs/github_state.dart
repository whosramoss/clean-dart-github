import 'package:github_commons/main.dart';

abstract class GithubState extends Equatable {
  const GithubState();

  @override
  List<Object> get props => [];
}

class DataInitialState extends GithubState {}

class DataLoadingState extends GithubState {
  final bool isLoading;
  const DataLoadingState({required this.isLoading});

  @override
  List<Object> get props => [isLoading];

  @override
  String toString() => 'DataLoadingState { isLoading: $isLoading }';
}

class DataSuccessState extends GithubState {
  final GithubProfileEntity profile;
  final List<GithubRepositoryEntity> lstRepositories;
  final List<GithubLanguageEntity> lstLanguages;

  const DataSuccessState({
    required this.profile,
    required this.lstRepositories,
    required this.lstLanguages,
  });

  @override
  List<Object> get props => [profile, lstRepositories, lstLanguages];

  @override
  String toString() =>
      'DataSuccessState { profile: $profile, lstRepositories: $lstRepositories , lstLanguages: $lstLanguages  }';
}

class DataErrorState extends GithubState {
  final GithubError? error;
  const DataErrorState({this.error});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'DataErrorState { error: $error }';
}

class UsernameStateCompleted extends GithubState {
  final String username;
  const UsernameStateCompleted({required this.username});

  @override
  List<Object> get props => [username];

  @override
  String toString() => 'UsernameStateCompleted { username: $username }';
}
