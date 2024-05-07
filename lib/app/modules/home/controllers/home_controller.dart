import 'package:get/get.dart';
import 'package:theeco/app/modules/home/models/todo_request_model.dart';
import 'package:theeco/app/modules/home/repositories/HomeRepository.dart';
import 'package:theeco/app/shared/utilities/the_dio.dart';

import '../interfaces/homeInterface.dart';
import '../models/todos_model.dart';

class HomeController extends GetxController {
  HomeInterface homeInterface;

  HomeController({required this.homeInterface}) {
    homeInterface = HomeRepository();
  }

  final RxBool isLoading = true.obs;
  final todos = List<TodosModel>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    TheDio.instance.dioHeaders();
    TheDio.instance.dioInterceptors();
  }

  @override
  void onReady() {
    super.onReady();
    getHomeData();
  }

  Future<void> getHomeData() async {
    try {
      isLoading.value = true;
      final response = await homeInterface.getHomeData();
      if (response.isEmpty) {
        Get.snackbar(
          'Error',
          'Failed to load data from server',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        todos.assignAll(response);
        isLoading.value = false;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load data from server',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> getHomeDataTow() async {
    try {
      isLoading.value = true;
      final response = await homeInterface.getHomeDataTow();
      if (response.isLeft) {
        Get.snackbar(
          'Error',
          response.left.message,
          snackPosition: SnackPosition.TOP,
        );
      } else {
        todos.assignAll(response.right);
        isLoading.value = false;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load data from server',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> postHomeData(TodoRequestModel todos) async {
    try {
      isLoading.value = true;
      final response = await homeInterface.postHomeData(todos);
      if (response.isLeft) {
        Get.snackbar(
          'Error',
          response.left.message,
          snackPosition: SnackPosition.TOP,
        );
      } else {
        this.todos.add(response.right);
        Get.snackbar(
          'Success',
          'Todo added successfully',
          snackPosition: SnackPosition.TOP,
        );
        isLoading.value = false;
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load data from server $e',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  updateTodo(TodosModel copyWith) {
    final index = todos.indexWhere((element) => element.id == copyWith.id);
    todos[index] = copyWith;
    Get.snackbar(
      'Success',
      'Todo updated successfully',
      snackPosition: SnackPosition.TOP,
    );
  }
}
