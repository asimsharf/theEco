import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  final dio = Dio();

  Future<void> fetchData() async {
    try {
      await dio.get('https://api.example.com/data').then(
        (response) {
          if (kDebugMode) {
            print(response.data);
          }
        },
      );
    } catch (error) {
      if (kDebugMode) {
        print('Error fetching data: $error');
      }
    }
  }

  Future<void> postData() async {
    try {
      await dio.post(
        'https://api.example.com/post',
        data: {'key': 'value'},
      ).then(
        (value) {
          if (kDebugMode) {
            print(value.data);
          }
        },
      );
    } catch (error) {
      if (kDebugMode) {
        print('Error posting data: $error');
      }
    }
  }
}
