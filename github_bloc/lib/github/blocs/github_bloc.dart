import 'package:flutter/material.dart';
import 'package:github_commons/main.dart';
import 'github_events.dart';
import 'github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  final FindProfile _findProfile;
  final FindRepositories _findRepositories;
  final FindStatsLanguage _findStatsLanguage;
  final IUrlOpen _urlOpen;

  GithubBloc(
    this._findProfile,
    this._findRepositories,
    this._findStatsLanguage,
    this._urlOpen,
  ) : super(DataInitialState()) {
    on<GetGithubData>((event, emit) async {
      try {
        emit(const DataLoadingState(isLoading: true));
        emit(const DataErrorState(error: null));

        final username = event.username;

        final profile = await _findProfile(username);
        final lstRepositories = await _findRepositories(username);
        final lstLanguages = _findStatsLanguage(lstRepositories);

        emit(DataSuccessState(
          profile: profile,
          lstLanguages: lstLanguages,
          lstRepositories: lstRepositories,
        ));
      } on GithubError catch (error) {
        debugPrint(error.toString());
        emit(DataErrorState(error: error));
      } finally {
        emit(const DataLoadingState(isLoading: false));
      }
    });

    on<SetUsernameText>((event, emit) async {
      final value = event.username;
      emit(UsernameStateCompleted(username: value));
    });

    on<OpenRepository>((event, emit) async {
      final value = event.url;
      await _urlOpen.launchUrl(value);
    });
  }
}
