// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GithubStore on GithubStoreBase, Store {
  late final _$_errorAtom =
      Atom(name: 'GithubStoreBase._error', context: context);

  @override
  GithubError? get _error {
    _$_errorAtom.reportRead();
    return super._error;
  }

  @override
  set _error(GithubError? value) {
    _$_errorAtom.reportWrite(value, super._error, () {
      super._error = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: 'GithubStoreBase._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_usernameAtom =
      Atom(name: 'GithubStoreBase._username', context: context);

  @override
  String get _username {
    _$_usernameAtom.reportRead();
    return super._username;
  }

  @override
  set _username(String value) {
    _$_usernameAtom.reportWrite(value, super._username, () {
      super._username = value;
    });
  }

  late final _$_profileAtom =
      Atom(name: 'GithubStoreBase._profile', context: context);

  @override
  GithubProfileEntity get _profile {
    _$_profileAtom.reportRead();
    return super._profile;
  }

  @override
  set _profile(GithubProfileEntity value) {
    _$_profileAtom.reportWrite(value, super._profile, () {
      super._profile = value;
    });
  }

  late final _$_lstRepositoriesAtom =
      Atom(name: 'GithubStoreBase._lstRepositories', context: context);

  @override
  List<GithubRepositoryEntity> get _lstRepositories {
    _$_lstRepositoriesAtom.reportRead();
    return super._lstRepositories;
  }

  @override
  set _lstRepositories(List<GithubRepositoryEntity> value) {
    _$_lstRepositoriesAtom.reportWrite(value, super._lstRepositories, () {
      super._lstRepositories = value;
    });
  }

  late final _$_lstLanguagesAtom =
      Atom(name: 'GithubStoreBase._lstLanguages', context: context);

  @override
  List<GithubLanguageEntity> get _lstLanguages {
    _$_lstLanguagesAtom.reportRead();
    return super._lstLanguages;
  }

  @override
  set _lstLanguages(List<GithubLanguageEntity> value) {
    _$_lstLanguagesAtom.reportWrite(value, super._lstLanguages, () {
      super._lstLanguages = value;
    });
  }

  late final _$setGithubDataAsyncAction =
      AsyncAction('GithubStoreBase.setGithubData', context: context);

  @override
  Future<void> setGithubData() {
    return _$setGithubDataAsyncAction.run(() => super.setGithubData());
  }

  late final _$GithubStoreBaseActionController =
      ActionController(name: 'GithubStoreBase', context: context);

  @override
  void setUsername(String value) {
    final _$actionInfo = _$GithubStoreBaseActionController.startAction(
        name: 'GithubStoreBase.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$GithubStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
