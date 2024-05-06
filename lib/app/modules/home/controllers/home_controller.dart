import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../providers/home_provider.dart';
import '../providers/interfaces/homeInterface.dart';
import '../providers/repositories/HomeRepositoryImplementation.dart';
import '../todos_model.dart';

class HomeController extends GetxController {
  late HomeInterface repository;

  HomeController({HomeInterface? repository}) {
    this.repository = repository ?? HomeRepositoryImplementation();
  }

  Future<void> getHomeData() async {
    try {
      isLoading.value = true;
      final response = await repository.getHomeData();
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

  final RxBool isLoading = true.obs;
  final todos = List<TodosModel>.empty(growable: true).obs;

  //  scrollController
  final scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    fetchData();
    getHomeData();
  }

  @override
  void onReady() {
    super.onReady();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchData();
        getHomeData();
      }

      // scroll pull to refresh
      if (scrollController.position.pixels ==
          scrollController.position.minScrollExtent) {
        fetchData();
        getHomeData();
      }
    });
  }

  fetchData() async {
    isLoading.value = true;
    await HomeProvider().fetchData().then((response) {
      if (response.status) {
        todos.clear();
        todos.assignAll(response.data);
        isLoading.value = false;
      } else {
        Get.snackbar(
          'Error',
          response.message,
          snackPosition: SnackPosition.TOP,
        );
      }
    });
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
