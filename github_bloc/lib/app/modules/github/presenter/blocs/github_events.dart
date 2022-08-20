import 'package:github_commons/main.dart';

abstract class GithubEvent extends Equatable {
  const GithubEvent();

  @override
  List<Object> get props => [];
}

class GetGithubData extends GithubEvent {
  final String username;
  const GetGithubData({required this.username});

  @override
  List<Object> get props => [username];

  @override
  String toString() => 'GetGithubData { username: $username }';
}

class SetUsernameText extends GithubEvent {
  final String username;
  const SetUsernameText({required this.username});

  @override
  List<Object> get props => [username];

  @override
  String toString() => 'SetUsernameText { username: $username }';
}

class OpenRepository extends GithubEvent {
  final String url;
  const OpenRepository({required this.url});

  @override
  List<Object> get props => [url];

  @override
  String toString() => 'OpenRepository { url: $url }';
}
