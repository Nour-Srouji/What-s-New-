import 'package:dio/dio.dart';

class Client {
  Dio _dio;
  static Client? _client; // يفضل تكون ستاتيك لانو خاصة بالكلاس
  Client._(this._dio); //لجعل الباني الافتراضي مخفي

  factory Client.create(String site) {
    _client ??= Client._(Dio(BaseOptions(
        baseUrl: site))); // if (_client == null) _client = Client._(Dio());
    return _client!;
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    return _dio.get(path,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters);
  }
}
