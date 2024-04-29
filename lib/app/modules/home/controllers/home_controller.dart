import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:theeco/app/modules/home/todos_model.dart';
import 'package:theeco/app/shared/utilities/the_api_failure_response.dart';
import 'package:theeco/app/shared/utilities/the_api_success_response.dart';

class HomeController extends GetxController {
  final todos = List<TodosModel>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer token';
    dio.options.headers['X-Requested-With'] = 'XMLHttpRequest';
    dio.options.headers['Access-Control-Allow-Origin'] = '*';
    // ... extra headers
  }

  @override
  void onReady() {
    super.onReady();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('REQUEST[${options.method}] => PATH: ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print(
              'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
          return handler.next(response);
        },
        onError: (DioException ex, handler) {
          print(
              'ERROR[${ex.response?.statusCode}] => PATH: ${ex.requestOptions.path}');
          return handler.next(ex);
        },
      ),
    );

    // Uncomment the following line to see the request and response data
    // dio.interceptors.add(LogInterceptor(
    //   responseBody: true,
    //   requestBody: true,
    //   requestHeader: true,
    //   responseHeader: true,
    // ));

    fetchData();

    // ... extra interceptors
  }

  @override
  void onClose() {
    super.onClose();
    dio.interceptors.clear();
  }

  final dio = Dio();

  Future<TheApiSuccessResponse> fetchData() async {
    try {
      final todosList = List<TodosModel>.empty(growable: true).obs;
      await dio.get('https://jsonplaceholder.typicode.com/todos').then(
        (response) {
          for (var item in response.data) {
            todosList.add(TodosModel.fromJson(item));
          }
        },
      );
      todos.clear();

      todos.assignAll(todosList);

      return TheApiSuccessResponse(
        data: todosList,
        message: 'Success',
        code: 200,
        status: true,
      );
    } catch (error) {
      throw TheApiFailureResponse(
        message: error.toString(),
        code: 500,
        status: false,
      );
    }
  }

  Future<void> postData() async {
    try {
      await dio.post(
        'https://jsonplaceholder.typicode.com/todos',
        data: {'key': 'value'},
      ).then(
        (value) {
          if (kDebugMode) {
            print(value.data);
          }
        },
      );
    } catch (error) {
      if (kDebugMode) {
        print('Error posting data: $error');
      }
    }
  }

  void updateTodo(TodosModel copyWith) {
    final index = todos.indexWhere((element) => element.id == copyWith.id);
    todos[index] = copyWith;
    update();
  }

  void deleteTodo() {
    // ... delete logic
  }

  void createTodo() {
    // ... create logic
  }

  void fetchTodo() {
    // ... fetch logic
  }
}
