import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FORMS'),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: controller.isNameValid.value
                        ? Colors.green
                        : Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller:
                      controller.nameController.value, // No need for .value
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: controller.isEmailValid.value
                        ? Colors.green
                        : Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller:
                      controller.emailController.value, // No need for .value
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: controller.isPasswordValid.value
                        ? Colors.green
                        : Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller:
                      controller.passwordController.value, // No need for .value
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: controller.isConfirmPasswordValid.value
                        ? Colors.green
                        : Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: controller
                      .confirmPasswordController.value, // No need for .value
                  decoration: const InputDecoration(
                    labelText: 'Confirm Password',
                    border: InputBorder.none,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: controller.isNameValid.value &&
                          controller.isEmailValid.value &&
                          controller.isPasswordValid.value &&
                          controller.isConfirmPasswordValid.value
                      ? Colors.green
                      : Colors.grey,
                ),
                onPressed: () {
                  if (controller.isNameValid.value &&
                      controller.isEmailValid.value &&
                      controller.isPasswordValid.value &&
                      controller.isConfirmPasswordValid.value) {
                    Get.snackbar(
                      'Success',
                      'All fields are valid',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    Get.snackbar(
                      'Error',
                      'Some fields are invalid',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                child: const Text('Submit'),
              ),
              const SizedBox(height: 20),
            ],
          );
        }),
      ),
    );
  }
}
