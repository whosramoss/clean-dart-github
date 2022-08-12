import 'package:dio/dio.dart';

import 'base_error.dart';

abstract class IDioHttpConnection {
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });
}

class DioHttpConnection implements IDioHttpConnection {
  final Dio _dio;

  DioHttpConnection(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: 'https://api.github.com/',
      receiveTimeout: const Duration(seconds: 30).inMilliseconds,
    );
    _dio.interceptors.add(ErrorInterceptor());
  }

  @override
  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );

      return response;
    } on DioError catch (error) {
      throw error.error;
    } catch (error, stacktrace) {
      throw DioHttpError(
        stackTrace: stacktrace,
        exception: error,
        label: 'DioHttpConnect',
      );
    }
  }
}
