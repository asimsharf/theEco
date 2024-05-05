import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theeco/app/modules/home/repository/HomeRepository.dart';
import 'package:theeco/app/modules/home/repository/HomeRepositoryImpl.dart';

import '../providers/home_provider.dart';
import '../todos_model.dart';

class HomeController extends GetxController {
  late HomeRepository repository;

  HomeController({HomeRepository? repository}) {
    this.repository = repository ?? HomeRepositoryImpl();
  }

  Future<void> getHomeData() async {
    try {
      final response = await repository.getHomeData();
      if (response.isEmpty) {
        Get.snackbar(
          'Error',
          'Failed to load data',
          snackPosition: SnackPosition.TOP,
        );
      } else {
        todos.assignAll(response);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load data',
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
  }

  @override
  void onReady() {
    super.onReady();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        fetchData();
      }

      // scroll pull to refresh
      if (scrollController.position.pixels ==
          scrollController.position.minScrollExtent) {
        fetchData();
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
