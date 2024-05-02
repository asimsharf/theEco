import 'package:dio/dio.dart';

class TheDio {
  /// Singleton
  static final TheDio instance = TheDio._();
  TheDio._();

  /// Properties
  final Dio dio = Dio();
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  // Headers
  void dioHeaders() {
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer token';
    dio.options.headers['X-Requested-With'] = 'XMLHttpRequest';
    dio.options.headers['Access-Control-Allow-Origin'] = '*';
  }

  // Interceptors
  void dioInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('REQUEST[${options.method}] => PATH: ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print(
            'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
          );
          return handler.next(response);
        },
        onError: (DioException ex, handler) {
          print(
            'ERROR[${ex.response?.statusCode}] => PATH: ${ex.requestOptions.path}',
          );
          return handler.next(ex);
        },
      ),
    );
  }

  /// Methods
  Future<Response> get(String path) async {
    return await dio.get('$baseUrl/$path');
  }

  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    return await dio.post('$baseUrl/$path', data: data);
  }

  Future<Response> put(String path, {Map<String, dynamic>? data}) async {
    return await dio.put('$baseUrl/$path', data: data);
  }

  Future<Response> delete(String path) async {
    return await dio.delete('$baseUrl/$path');
  }

  Future<Response> patch(String path, {Map<String, dynamic>? data}) async {
    return await dio.patch('$baseUrl/$path', data: data);
  }

  Future<Response> head(String path) async {
    return await dio.head('$baseUrl/$path');
  }

  Future<Response> download(String path, String savePath) async {
    return await dio.download('$baseUrl/$path', savePath);
  }

  Future<Response> upload(String path, String filePath) async {
    return await dio.post('$baseUrl/$path', data: filePath);
  }
}
