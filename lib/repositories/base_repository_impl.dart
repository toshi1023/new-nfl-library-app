import 'package:dio/dio.dart';
import 'package:nfl_library_app/consts/api_constants.dart';
import 'package:nfl_library_app/types/api/api_result.dart';
import 'package:nfl_library_app/repositories/base_repository.dart';

/// BaseRepositoryの実装クラス
/// Dioを使用したHTTP通信の共通処理を提供する
class BaseRepositoryImpl implements BaseRepository {
  final Dio _dio;

  BaseRepositoryImpl({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: ApiConstants.baseUrl,
                connectTimeout:
                    const Duration(milliseconds: ApiConstants.connectTimeout),
                receiveTimeout:
                    const Duration(milliseconds: ApiConstants.receiveTimeout),
                sendTimeout:
                    const Duration(milliseconds: ApiConstants.sendTimeout),
                headers: {
                  'Content-Type': ApiConstants.contentType,
                  'Accept': ApiConstants.accept,
                },
              ),
            );

  @override
  Future<ApiResult<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic) fromJson,
  }) async {
    return _request(
      () => _dio.get(path, queryParameters: queryParameters),
      fromJson: fromJson,
    );
  }

  @override
  Future<ApiResult<T>> post<T>(
    String path, {
    dynamic data,
    required T Function(dynamic) fromJson,
  }) async {
    return _request(
      () => _dio.post(path, data: data),
      fromJson: fromJson,
    );
  }

  @override
  Future<ApiResult<T>> put<T>(
    String path, {
    dynamic data,
    required T Function(dynamic) fromJson,
  }) async {
    return _request(
      () => _dio.put(path, data: data),
      fromJson: fromJson,
    );
  }

  @override
  Future<ApiResult<T>> delete<T>(
    String path, {
    dynamic data,
    required T Function(dynamic) fromJson,
  }) async {
    return _request(
      () => _dio.delete(path, data: data),
      fromJson: fromJson,
    );
  }

  @override
  Future<ApiResult<T>> patch<T>(
    String path, {
    dynamic data,
    required T Function(dynamic) fromJson,
  }) async {
    return _request(
      () => _dio.patch(path, data: data),
      fromJson: fromJson,
    );
  }

  /// HTTP リクエストの共通処理
  /// DioException を捕捉し、ApiResult に変換する
  Future<ApiResult<T>> _request<T>(
    Future<Response<dynamic>> Function() request, {
    required T Function(dynamic) fromJson,
  }) async {
    try {
      final response = await request();
      final json = response.data as Map<String, dynamic>;
      final data = fromJson(json['data']);
      return ApiResult.success(
        message: json['message'] ?? '',
        data: data,
      );
    } on DioException catch (e) {
      return _handleDioException(e);
    }
  }

  /// DioException をハンドリングし、ApiResult に変換する
  ApiResult<T> _handleDioException<T>(DioException e) {
    final json = e.response?.data;

    if (json is Map<String, dynamic>) {
      // バリデーションエラー（422）
      if (e.response?.statusCode == 422) {
        return ApiResult.validationError(
          message: json['message'] ?? '',
          errors: (json['errors'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, List<String>.from(value)),
          ),
        );
      }

      // その他のAPIエラー
      return ApiResult.error(
        message: json['message'] ?? '',
        error: json['error'] ?? 'Unknown error',
      );
    }

    // レスポンスボディが不正またはネットワークエラー
    return ApiResult.error(
      message: '通信エラーが発生しました',
      error: e.message ?? e.toString(),
    );
  }
}
