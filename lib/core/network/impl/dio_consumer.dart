import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../common/widgets/indicators/habits_loading.dart';
import '../../error/error_handler.dart';
import '../interfaces/api_consumer.dart';
import '../interfaces/network_info.dart';
import '../config/network_config.dart';
import '../interceptors/auth_interceptor.dart';
import '../interceptors/retry_interceptor.dart';
import '../../error/failures.dart';
import '../../utils/utils.dart';
import '../../session/user_session.dart';
export 'dio_consumer_extensions.dart';

/// Comprehensive Dio implementation of ApiConsumer
class DioConsumer implements ApiConsumer {
  late final Dio _dio;
  final NetworkConfig config;
  final AuthInterceptor authInterceptor;
  final NetworkInfo networkInfo;

  DioConsumer({
    required this.config,
    required this.authInterceptor,
    required this.networkInfo,
  }) {
    _dio = Dio();
    _initializeDio();
  }

  void _initializeDio() {
    _dio.options = BaseOptions(
      baseUrl: config.baseUrl,
      connectTimeout: config.connectTimeout,
      receiveTimeout: config.receiveTimeout,
      sendTimeout: config.sendTimeout,
      headers: _getDefaultHeaders(),
      validateStatus: (status) =>
          status != null &&
          (status < 400 || status == 302), // 302 is redirect, treat as success
      followRedirects: true,
      receiveDataWhenStatusError: true,
    );

    // Add 401 handler interceptor first
    _dio.interceptors.add(authInterceptor);

    // Add Retry interceptor
    if (config.enableRetry) {
      _dio.interceptors.add(
        RetryInterceptor(
          maxRetries: config.maxRetries,
          retryDelay: config.retryDelay,
        ),
      );
    }

    // Add logging interceptor
    if (config.enableLogging && kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }

  Map<String, dynamic> _getDefaultHeaders() {
    return {
      "Accept": "application/json",
      "Accept-Language": Utils.lang.isNotEmpty ? Utils.lang : "en",
      "Content-Type": "application/json",
      ...config.defaultHeaders,
    };
  }

  void _updateHeaders({required String method, bool isFile = false}) {
    final defaultHeaders = _getDefaultHeaders();
    _dio.options.headers = {
      ...defaultHeaders,
      if (UserSession.token.isNotEmpty)
        "Authorization": 'Bearer ${UserSession.token}',
    };

    // Avoid adding Content-Type for GET requests
    if (method.toUpperCase() != 'GET') {
      if (isFile) {
        // FormData handles Content-Type automatically with boundary
        _dio.options.headers.remove("Content-Type");
      } else {
        _dio.options.headers["Content-Type"] = "application/json";
      }
    } else {
      _dio.options.headers.remove("Content-Type");
    }
  }

  Future<ApiResult<T>> _handleRequest<T>({
    required Future<Response> Function() request,
    T Function(Map<String, dynamic>)? parser,
    bool showLoading = false,
  }) async {
    if (!await networkInfo.isConnected) {
      return ApiResult.failure(NoInternetFailure());
    }

    if (showLoading) HabitsLoading.show();
    try {
      final response = await request();
      if (showLoading) HabitsLoading.dismis();

      if (parser != null) {
        return ApiResult.success(parser(response.data));
      }
      return ApiResult.success(response.data as T);
    } catch (e) {
      if (showLoading) HabitsLoading.dismis();
      if (e is DioException) {
        return ApiResult.failure(ErrorHandler.handleDioException(e));
      }
      return ApiResult.failure(
        UnknownFailure(
          message: e.toString(),
          originalError: e,
          stackTrace: StackTrace.current,
        ),
      );
    }
  }

  @override
  Future<ApiResult<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    T Function(Map<String, dynamic>)? parser,
    bool showLoading = false,
  }) {
    _updateHeaders(method: 'GET');
    return _handleRequest<T>(
      request: () => _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      ),
      parser: parser,
      showLoading: showLoading,
    );
  }

  @override
  Future<ApiResult<T>> post<T>({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    T Function(Map<String, dynamic>)? parser,
    bool isFormData = false,
    bool showLoading = false,
  }) {
    _updateHeaders(method: 'POST', isFile: isFormData);
    return _handleRequest<T>(
      request: () => _dio.post(
        path,
        data: isFormData ? FormData.fromMap(body ?? {}) : body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      ),
      parser: parser,
      showLoading: showLoading,
    );
  }

  @override
  Future<ApiResult<T>> put<T>({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    T Function(Map<String, dynamic>)? parser,
    bool isFormData = false,
    bool showLoading = false,
  }) {
    _updateHeaders(method: 'PUT', isFile: isFormData);
    return _handleRequest<T>(
      request: () => _dio.put(
        path,
        data: isFormData ? FormData.fromMap(body ?? {}) : body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      ),
      parser: parser,
      showLoading: showLoading,
    );
  }

  @override
  Future<ApiResult<T>> patch<T>({
    required String path,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    T Function(Map<String, dynamic>)? parser,
    bool isFormData = false,
    bool showLoading = false,
  }) {
    _updateHeaders(method: 'PATCH', isFile: isFormData);
    return _handleRequest<T>(
      request: () => _dio.patch(
        path,
        data: isFormData ? FormData.fromMap(body ?? {}) : body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      ),
      parser: parser,
      showLoading: showLoading,
    );
  }

  @override
  Future<ApiResult<T>> delete<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    T Function(Map<String, dynamic>)? parser,
    bool showLoading = false,
  }) {
    _updateHeaders(method: 'DELETE');
    return _handleRequest<T>(
      request: () => _dio.delete(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      ),
      parser: parser,
      showLoading: showLoading,
    );
  }

  @override
  Future<ApiResult<T>> uploadFile<T>({
    required String path,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    T Function(Map<String, dynamic>)? parser,
    void Function(int sent, int total)? onProgress,
    bool showLoading = false,
  }) {
    _updateHeaders(method: 'POST', isFile: true);
    return _handleRequest<T>(
      request: () => _dio.post(
        path,
        data: FormData.fromMap(data),
        queryParameters: queryParameters,
        options: Options(headers: headers),
        onSendProgress: onProgress,
      ),
      parser: parser,
      showLoading: showLoading,
    );
  }

  @override
  Future<ApiResult<String>> downloadFile({
    required String path,
    required String savePath,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    void Function(int received, int total)? onProgress,
    bool showLoading = false,
  }) async {
    if (showLoading) HabitsLoading.show();
    try {
      _updateHeaders(method: 'GET');
      await _dio.download(
        path,
        savePath,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        onReceiveProgress: onProgress,
      );
      if (showLoading) HabitsLoading.dismis();
      return ApiResult.success(savePath);
    } on DioException catch (e) {
      if (showLoading) HabitsLoading.dismis();
      return ApiResult.failure(ErrorHandler.handleDioException(e));
    } catch (e, stackTrace) {
      if (showLoading) HabitsLoading.dismis();
      return ApiResult.failure(
        UnknownFailure(
          message: e.toString(),
          originalError: e,
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
