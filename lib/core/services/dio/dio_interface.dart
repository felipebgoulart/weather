import 'package:dio/dio.dart';

abstract class IDio {
  Future<Response<T>> delete<T>(
    String path,
    {
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken
    }
  );

  Future<Response<T>> get<T>(
    String path,
    {
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress
    }
  );

  Future<Response<T>> patch<T>(
    String path,
    {
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
    }
  );

  Future<Response<T>> post<T>(
    String path,
    {
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
    }
  );

  Future<Response<T>> put<T>(
    String path,
    {
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
    }
  );
}
