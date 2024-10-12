import 'package:get/get.dart';

import 'AuthController.dart';
import 'AuthRepository.dart';
import 'AuthService.dart';
import 'IAuthService.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAuthService>(() => AuthRepository());
    Get.lazyPut<AuthService>(() => AuthService(Get.find<IAuthService>()));
    Get.put(AuthController(Get.find<AuthService>()));
  }
}
