import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controllers/home_controller.dart';
import '../widgets/show_bottom_modale_sheet.dart';

class DesigningView extends GetView<HomeController> {
  const DesigningView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("واجهة الإختبارات"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: () {
              showBottomModalSheet(context);
            },
            child: const Text('showBottomModalSheet'),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              showConfirmBottomModalSheet(context);
            },
            child: const Text('showConfirmBottomModalSheet'),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              showConfirmDialog(context);
            },
            child: const Text('showDialog'),
          ),
        ],
      ),
    );
  }
}
