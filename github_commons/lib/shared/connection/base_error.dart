abstract class BaseError {
  final StackTrace? stackTrace;
  final dynamic exception;
  final String? label;
  final String errorMessage;

  BaseError({
    this.stackTrace,
    this.exception,
    this.label,
    required this.errorMessage,
  });

  @override
  String toString() => errorMessage;
}

class DioHttpError extends BaseError {
  DioHttpError(
      {StackTrace? stackTrace, dynamic exception, required String label})
      : super(
          stackTrace: stackTrace,
          exception: exception,
          label: label,
          errorMessage: label,
        );
}
