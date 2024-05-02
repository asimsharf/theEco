import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      ),
      body: Obx(
        () => ListView.builder(
          controller: controller.scrollController,
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
    );
  }
}
