import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theeco/app/modules/home/views/custom_dropdown_button.dart';
import 'package:theeco/app/shared/widgets/shimmer_box.dart';
import 'package:theeco/app/shared/widgets/shimmer_lines.dart';

import '../controllers/home_controller.dart';
import '../models/todo_request_model.dart';
import '../widgets/show_bottom_modale_sheet.dart';

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
          IconButton(
            icon: const Icon(Icons.token),
            onPressed: () {
              Get.to(() => const PageTemp());
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

class PageTemp extends StatelessWidget {
  const PageTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageTemp'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.token),
            onPressed: () {
              Get.to(() => const StudentTemp());
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('Back to Home'),
          ),
        ],
      ),
    );
  }
}

class StudentTemp extends StatelessWidget {
  const StudentTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StudentTemp deleteAll'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.token),
            onPressed: () {
              Get.until((route) => Get.currentRoute == '/PageTemp');
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            child: CustomDropdownButton(
              hint: 'Select Your Item',
              value: 'Item 1',
              dropdownItems: const [
                'Item 1',
                'Item 2',
                'Item 3',
                'Item 4',
                'Item 5',
              ],
              onChanged: (value) {
                print(value);
              },
              buttonHeight: 50,
              buttonWidth: double.infinity,
              buttonPadding: const EdgeInsets.symmetric(horizontal: 20),
              buttonDecoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                  width: 0.2,
                ),
              ),
              buttonElevation: 0,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              iconEnabledColor: Colors.black45,
              iconDisabledColor: Colors.black45,
              itemHeight: 50,
              itemPadding: const EdgeInsets.symmetric(horizontal: 16),
              dropdownHeight: 300,
              dropdownWidth: Get.width - 40,
              dropdownPadding: const EdgeInsets.symmetric(horizontal: 15),
              dropdownDecoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              dropdownElevation: 8,
              scrollbarRadius: const Radius.circular(10),
              scrollbarThickness: 1,
              scrollbarAlwaysShow: false,
              offset: const Offset(0, 0),
            ),
          ),
          InkWell(
            onTap: () {
              showBottomModalSheet(context);
            },
            child: const Text('showBottomModalSheet'),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              showConfirmBottomModalSheet(context);
            },
            child: const Text('showConfirmBottomModalSheet'),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              showConfirmDialog(context);
            },
            child: const Text('showDialog'),
          ),
        ],
      ),
    );
  }
}
