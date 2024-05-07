import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../repositories/HomeRepository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        homeInterface: HomeRepository(),
      ),
    );
  }
}
