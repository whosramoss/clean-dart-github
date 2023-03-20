import 'package:flutter/material.dart';
import 'package:github_commons/main.dart';
import 'github_events.dart';
import 'github_state.dart';

import 'package:bloc/bloc.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  final UrlOpen urlOpen;
  final Dio dio;
  final GithubDatasource datasource;
  final GithubRepository repository;
  final GetProfile getProfile;
  final GetRepositories getRepositories;
  final GetLanguages getLanguages;

  GithubBloc(
    this.urlOpen,
    this.dio,
    this.datasource,
    this.repository,
    this.getProfile,
    this.getRepositories,
    this.getLanguages,
  ) : super(InitialState()) {
    on<GetGithubData>((event, emit) async {
      try {
        emit(LoadingState());

        final GithubProfileEntity profile = await getProfile(event.username);
        final List<GithubRepositoryEntity> lstRepositories = await getRepositories(event.username);
        final List<GithubLanguageEntity> lstLanguages = getLanguages(lstRepositories);

        emit(SuccessState(
          profile: profile,
          lstLanguages: lstLanguages,
          lstRepositories: lstRepositories,
        ));
      } on GithubError catch (error) {
        debugPrint(error.toString());
        emit(ErrorState(error: error));
      }
    });

    on<SetUsernameText>((event, emit) async {
      final value = event.username;
      emit(UsernameStateCompleted(username: value));
    });

    on<OpenRepository>((event, emit) async {
      final value = event.url;
      await urlOpen.openUrl(value);
    });
  }
}
