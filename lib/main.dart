import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        fontFamily: 'din_next_tl_arabic_regular',
      ),
    ),
  );
}
