import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:theeco/app/modules/home/models/todos_model.dart';
import 'package:theeco/app/modules/home/utils/home_language_keys.dart';
import 'package:theeco/app/modules/home/widgets/the_cupertino_button.dart';
import 'package:theeco/app/shared/utilities/colors/the_colors.dart';
import 'package:theeco/app/shared/utilities/styles/the_styles.dart';
import 'package:theeco/app/shared/widgets/shimmer_box.dart';
import 'package:theeco/app/shared/widgets/shimmer_lines.dart';

import '../../../shared/widgets/shared_custom_dropdown.dart';
import '../controllers/home_controller.dart';
import '../models/todo_request_model.dart';
import '../widgets/the_custom_calendar.dart';
import '../widgets/the_custom_timeline.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          HomeLanguageKeys.homeScreen,
          style: TheStyles.title,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add,
              color: TheColors.icon,
            ),
            onPressed: () {
              TodoRequestModel todoRequestModel = TodoRequestModel(
                userId: 1,
                completed: true,
                title: 'الرقم الوطني الموحد',
                description: 'New Todo Description',
              );
              controller.postHomeData(todoRequestModel);
            },
            style: TheStyles.buttonStyle,
          ),
          IconButton(
            icon: const Icon(
              Icons.token,
              color: TheColors.icon,
            ),
            onPressed: () {},
            style: TheStyles.buttonStyle,
          ),
        ],
      ),
      body: Obx(
        () => ListView(
          children: [
            Obx(
              () {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: TheColors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(
                          color: const Color(0xFFDADBDC),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: const Color(0xFF00AE9A),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(7.r),
                                topRight: Radius.circular(7.r),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: TheColors.white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 2.h),
                                  child: Text(
                                    "التقويم",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: TheColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          theCustomCalendar(
                            calendarFormat: controller.format.value,
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: controller.selectedDay.value,
                            multipleSelection: false,
                            onFormatChanged: (format) {
                              controller.format.value = format;
                            },
                            selectedDayPredicate: (day) {
                              return isSameDay(
                                controller.selectedDay.value,
                                day,
                              );
                            },
                            onDaySelected: (day, focused) {
                              controller.selectedDay.value = day;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 61.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEF6D5),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        children: [
                          // Complication date: ex: 4 August 2021
                          Padding(
                            padding: EdgeInsets.only(
                              left: 20.w,
                              right: 20.w,
                            ),
                            child: Text(
                              "${controller.selectedDay.value.day} ${controller.selectedDay.value.month.toString()} ${controller.selectedDay.value.year}",
                              style: TextStyle(
                                color: const Color(0xFF004D41),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final result = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          initialEntryMode: TimePickerEntryMode.dialOnly,
                          helpText: "Select Time",
                          hourLabelText: "Hour",
                          minuteLabelText: "Minute",
                          anchorPoint: const Offset(0.5, 0.5),
                          errorInvalidText: "Invalid Time",
                          builder: (context, child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: Color(0xFF004D41),
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(),
                                ),
                              ),
                              child: child!,
                            );
                          },
                          orientation: MediaQuery.of(context).orientation,
                          barrierColor: Colors.black.withOpacity(0.5),
                          barrierDismissible: true,
                          barrierLabel: "Dismiss",
                        );
                      },
                      child: const Text("Show Time Picker"),
                    ),
                  ],
                );
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TheCupertinoButton(
                text: 'Get Todos',
                onPressed: controller.getHomeData,
              ),
            ),
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

  Widget theTimeLineBuild(context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 4,
      itemBuilder: (context, index) {
        return theCustomTimeline(
          context: context,
          index: index,
          height: 346.h,
          isEn: Get.locale?.languageCode == 'en',
          title: DateTime.now().year.toString().substring(2, 4),
          subtitle: DateTime.now().month.toString(),
          child: Container(
            width: 322.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: const Color(0xFFECEDEE),
                width: 2,
              ),
            ),
          ),
        );
      },
    );
  }
}
