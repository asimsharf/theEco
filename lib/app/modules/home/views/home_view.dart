import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theeco/app/modules/home/models/todos_model.dart';
import 'package:theeco/app/shared/utilities/colors/the_colors.dart';
import 'package:theeco/app/shared/utilities/styles/the_styles.dart';
import 'package:theeco/app/shared/widgets/shimmer_box.dart';
import 'package:theeco/app/shared/widgets/shimmer_lines.dart';

import '../../../shared/widgets/shared_custom_dropdown.dart';
import '../controllers/home_controller.dart';
import '../models/todo_request_model.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HomeView',
          style: TheStyles.title,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              TodoRequestModel todoRequestModel = TodoRequestModel(
                userId: 1,
                completed: true,
                title: 'الرقم الوطني الموحد',
                description: 'New Todo Description',
              );
              controller.postHomeData(todoRequestModel);
            },
            style: TheStyles.buttonStyle.copyWith(
              backgroundColor: WidgetStateProperty.all(TheColors.primary),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.token),
            onPressed: () {},
          ),
        ],
      ),
      body: Obx(
        () => ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              child: SharedCustomDropdown<TodosModel>(
                hint: 'Select Your Todos',
                value: controller.getSelectedTodo,
                dropdownItems: controller.todos,
                onChanged: (TodosModel? newValue) {
                  controller.setSelectedTodo = newValue!;
                },
                getDisplayText: (TodosModel todo) => todo.title,
                buttonHeight: 50,
                buttonWidth: double.infinity,
                buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
                buttonDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFFDADBDC),
                    width: 1,
                  ),
                ),
                buttonElevation: 0,
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFF004D41),
                ),
                iconSize: 24,
                iconEnabledColor: Colors.black45,
                iconDisabledColor: Colors.black45,
                itemPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 0,
                ),
                dropdownHeight: 300,
                dropdownDecoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFFDADBDC),
                    width: 1,
                  ),
                ),
                dropdownElevation: 0,
                scrollbarRadius: const Radius.circular(100),
                scrollbarThickness: 5,
                scrollbarAlwaysShow: true,
                offset: const Offset(0, -8),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.itemCount,
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
                              controller.todos[index]
                                  .copyWith(completed: value),
                            );
                          },
                        ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.getHomeDataTow,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
