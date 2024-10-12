import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  var isNameValid = true.obs;
  var isEmailValid = true.obs;
  var isPasswordValid = true.obs;
  var isConfirmPasswordValid = true.obs;

  void onChangedEmail(String value) {
    isEmailValid.value = Validators.isEmailValid(value);
  }

  void onChangedPassword(String value) {
    isPasswordValid.value = Validators.isPasswordValid(value);
  }

  void onChangedConfirmPassword(String value) {
    isConfirmPasswordValid.value =
        Validators.isConfirmPasswordValid(value, passwordController.value.text);
  }

  void onChangedName(String value) {
    isNameValid.value = Validators.isNameValid(value);
  }

  @override
  void onInit() {
    super.onInit();
    emailController.value.addListener(() {
      onChangedEmail(emailController.value.text);
    });
    passwordController.value.addListener(() {
      onChangedPassword(passwordController.value.text);
    });
    confirmPasswordController.value.addListener(() {
      onChangedConfirmPassword(confirmPasswordController.value.text);
    });

    nameController.value.addListener(() {
      onChangedName(nameController.value.text);
    });
  }

  @override
  void onClose() {
    nameController.value.dispose();
    super.onClose();
  }
}

class Validators {
  static bool isNameValid(String value) {
    if (value.isEmpty || value.isEmail) {
      return false;
    } else if (value.length < 3) {
      return false;
    } else if (value.length > 50) {
      return false;
    } else {
      return true;
    }
  }

  static bool isEmailValid(String value) {
    if (value.isEmpty || !value.isEmail) {
      return false;
    } else {
      return true;
    }
  }

  static bool isPasswordValid(String value) {
    if (value.isEmpty || value.length < 6) {
      return false;
    } else {
      return true;
    }
  }

  static bool isConfirmPasswordValid(String value, String password) {
    if (value.isEmpty || value != password) {
      return false;
    } else {
      return true;
    }
  }

  static bool isEmail(String value) {
    return GetUtils.isEmail(value);
  }
}
