class GithubError {
  final StackTrace? stackTrace;
  final dynamic exception;
  final String? label;
  final String errorMessage;
  final int statusCode;

  GithubError({
    this.stackTrace,
    this.exception,
    this.label = 'GithubError',
    required this.errorMessage,
    required this.statusCode,
  });

  static GithubError get empty => GithubError(errorMessage: '', statusCode: 0);

  @override
  String toString() => errorMessage;
}
