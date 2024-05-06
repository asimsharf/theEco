import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theeco/app/modules/home/todo_request_model.dart';
import 'package:theeco/app/shared/widgets/shimmer_box.dart';
import 'package:theeco/app/shared/widgets/shimmer_lines.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              TodoRequestModel todoRequestModel = TodoRequestModel(
                userId: 1,
                completed: true,
                title: 'New Todo',
                description: 'New Todo Description',
              );
              controller.postHomeData(todoRequestModel);
            },
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.isLoading.value ? 30 : controller.todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: controller.isLoading.value
                  ? const PlaceholderLines(lines: 3)
                  : Text(controller.todos[index].title),
              leading: controller.isLoading.value
                  ? const PlaceholderBox(shape: BoxShape.circle)
                  : CircleAvatar(
                      child: Text(
                        controller.todos[index].id.toString(),
                      ),
                    ),
              trailing: controller.isLoading.value
                  ? const PlaceholderBox(shape: BoxShape.rectangle)
                  : Checkbox(
                      value: controller.todos[index].completed,
                      onChanged: (value) {
                        controller.updateTodo(
                          controller.todos[index].copyWith(completed: value),
                        );
                      },
                    ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.getHomeDataTow,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
