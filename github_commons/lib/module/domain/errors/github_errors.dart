import '../../../shared/utils/connection/base_error.dart';

class GithubError extends BaseError {
  GithubError({
    StackTrace? stackTrace,
    dynamic exception,
    required String label,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          exception: exception,
          label: 'GithubError-$label',
          errorMessage: errorMessage,
        );
}

class GithubDatasourceError extends GithubError {
  GithubDatasourceError({
    StackTrace? stackTrace,
    dynamic exception,
    String errorMessage = 'Error',
  }) : super(
          stackTrace: stackTrace,
          exception: exception,
          label: 'GithubDatasourceError',
          errorMessage: errorMessage,
        );
}
