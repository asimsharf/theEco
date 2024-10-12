import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'AuthService.dart';

class AuthController extends GetxController {
  final AuthService _authService;

  AuthController(this._authService);

  RxBool isLoading = false.obs;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login(String username, String password) async {
    isLoading.value = true;
    await _authService.login(username, password);
    isLoading.value = false;
  }
}
