import 'package:dio/dio.dart';

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

class UrlOpenError extends BaseError {
  UrlOpenError({
    StackTrace? stackTrace,
    dynamic exception,
    String label = '',
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          exception: exception,
          label: 'UrlOpenError-$label',
          errorMessage: errorMessage,
        );
}

class HttpError extends BaseError {
  final int statusCode;

  HttpError({
    StackTrace? stackTrace,
    dynamic exception,
    String label = '',
    required String errorMessage,
    required this.statusCode,
  }) : super(
          stackTrace: stackTrace,
          exception: exception,
          label: 'HttpError-$label',
          errorMessage: errorMessage,
        );
}

class ErrorInterceptor extends Interceptor {
  @override
  onError(DioError err, handler) async {
    final statusMessage = err.response?.statusMessage;
    final statusCode = err.response?.statusCode;
    var dataError = _getDataError(err.response?.data);

    if (dataError.isEmpty) {
      dataError = err.message;
    }

    err.error = HttpError(
      exception: statusMessage,
      errorMessage: dataError,
      statusCode: statusCode ?? 0,
    );

    return handler.next(err);
  }

  String _getDataError(dynamic body) {
    try {
      if (body == null) return '';

      if (body is String) return body;

      return body['message']?.toString() ?? '';
    } catch (error) {
      return '';
    }
  }
}
