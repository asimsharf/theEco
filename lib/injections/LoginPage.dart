import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'AuthController.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return controller.isLoading.value
            ? const CircularProgressIndicator()
            : Column(
                children: [
                  TextField(controller: controller.usernameController),
                  TextField(controller: controller.passwordController),
                  ElevatedButton(
                    onPressed: () {
                      controller.login(
                        controller.usernameController.text,
                        controller.passwordController.text,
                      );
                    },
                    child: const Text('Login'),
                  ),
                ],
              );
      }),
    );
  }
}
