import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:github_commons/main.dart';
import '../utils/exports.dart';
import 'github_events.dart';
import 'github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  final UrlOpen urlOpen;
  final Dio dio;
  final GithubDatasource datasource;
  final GithubRepository repository;
  final FindProfile findProfile;
  final FindRepositories findRepositories;
  final FindStatsLanguage findStatsLanguage;

  GithubBloc(
    this.urlOpen,
    this.dio,
    this.datasource,
    this.repository,
    this.findProfile,
    this.findRepositories,
    this.findStatsLanguage,
  ) : super(InitialState()) {
    on<GetGithubData>((event, emit) async {
      try {
        emit(LoadingState());

        final username = event.username;

        final profile = await findProfile(username);
        log('profile getted');
        final lstRepositories = await findRepositories(username);
        log('lstRepositories getted');
        final lstLanguages = findStatsLanguage(lstRepositories);
        log('lstLanguages getted');

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
      await urlOpen.launchUrl(value);
    });
  }
}
