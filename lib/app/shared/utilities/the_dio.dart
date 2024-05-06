import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class TheDio {
  /// Singleton
  static final TheDio instance = TheDio._();
  TheDio._();

  /// Properties
  final Dio dio = Dio();
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  // Headers
  Future<void> dioHeaders() async {
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer token';
    dio.options.headers['X-Requested-With'] = 'XMLHttpRequest';
    dio.options.headers['Access-Control-Allow-Origin'] = '*';
  }

  // Interceptors
  Future<void> dioInterceptors() async {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (kDebugMode) {
            log(
              '[${options.method}] => PATH: ${options.path}',
              name: "TheDio REQUEST ",
            );
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) {
            log(
              '[${response.statusCode}] => PATH: ${response.requestOptions.path}',
              name: "TheDio RESPONSE",
            );
          }
          return handler.next(response);
        },
        onError: (DioException ex, handler) {
          if (kDebugMode) {
            log(
              '[${ex.response?.statusCode}] => PATH: ${ex.requestOptions.path}',
              name: "TheDio ERROR",
            );
          }
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
