import 'package:nfl_library_app/types/api/api_result.dart';

/// BaseRepositoryのinterface
/// 全てのRepositoryはこのinterfaceを実装する
abstract class BaseRepository {
  /// GETリクエスト
  Future<ApiResult<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic) fromJson,
  });

  /// POSTリクエスト
  Future<ApiResult<T>> post<T>(
    String path, {
    dynamic data,
    required T Function(dynamic) fromJson,
  });

  /// PUTリクエスト
  Future<ApiResult<T>> put<T>(
    String path, {
    dynamic data,
    required T Function(dynamic) fromJson,
  });

  /// DELETEリクエスト
  Future<ApiResult<T>> delete<T>(
    String path, {
    dynamic data,
    required T Function(dynamic) fromJson,
  });

  /// PATCHリクエスト
  Future<ApiResult<T>> patch<T>(
    String path, {
    dynamic data,
    required T Function(dynamic) fromJson,
  });
}
