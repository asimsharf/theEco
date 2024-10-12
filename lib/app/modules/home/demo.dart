import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  var items = <String>[].obs; // Reactive list of items

  void addItem() {
    items.add('Item ${items.length + 1}');
  }
}

class AutoHeightBottomSheetExample extends StatelessWidget {
  final MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auto-height BottomSheet with ListView'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showBottomSheet(context);
          },
          child: const Text('Show BottomSheet'),
        ),
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    Get.bottomSheet(
      Obx(
        () => Container(
          // Adjust height dynamically based on content
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height *
                0.8, // Max height for BottomSheet
          ),
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Auto adjust height
            children: [
              const Text(
                'Items List',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable internal scrolling
                  itemCount: myController.items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(myController.items[index]),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  myController.addItem();
                },
                child: const Text('Add Another Item'),
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true, // Make BottomSheet scrollable
    );
  }
}

void main() {
  runApp(GetMaterialApp(home: AutoHeightBottomSheetExample()));
}
