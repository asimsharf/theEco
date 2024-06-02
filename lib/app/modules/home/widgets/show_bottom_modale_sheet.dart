import 'package:flutter/material.dart';
import 'package:get/get.dart';

showBottomModalSheet(BuildContext context) {
  Get.bottomSheet(
    Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  "Eligibility Criteria's for Unemployment Insurance",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                // Subtitle
                Text(
                  "You are not meeting 4 of the 11 criteria's to be eligible for your First-time SANED compensation.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 60),
              child: Container(
                // height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.separated(
                  itemCount: 100,
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {},
                      leading: Icon(
                        index % 2 == 0
                            ? Icons.check_circle_outline
                            : Icons.cancel_outlined,
                        color: index % 2 == 0
                            ? const Color(0xFF00AE9A)
                            : const Color(0xFFD94747),
                        size: 30,
                      ),
                      title: const Text(
                        "1. The contributor's age must be less than 60 years",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 56,
                child: OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: Color(0xFF004D41),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Close",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF004D41),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

showConfirmBottomModalSheet(BuildContext context) {
  Get.bottomSheet(
    isScrollControlled: true,
    Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Close icon
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),

                const SizedBox(height: 10),
                // Subtitle
                Text(
                  "You’re about to raise an engagement cancellation of 9 months and 5 days. Are you sure want to proceed?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
            Positioned(
              bottom: 70,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 56,
                child: OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFFABD02B),
                    side: const BorderSide(
                      color: Color(0xFFABD02B),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF004D41),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 56,
                child: OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: Color(0xFF004D41),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "Close",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF004D41),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

showConfirmDialog(BuildContext context) {
  Get.defaultDialog(
    contentPadding: const EdgeInsets.all(20),
    title: "Dialog Title",
    titleStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    backgroundColor: Colors.white,
    content: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "You’re about to raise an engagement cancellation of 9 months and 5 days. Are you sure want to proceed?",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black.withOpacity(0.6),
        ),
      ),
    ),
    textConfirm: "Confirm",
    textCancel: "Cancel",
    confirmTextColor: Colors.white,
    cancelTextColor: Colors.black,
    buttonColor: Colors.green,
    cancel: OutlinedButton(
      onPressed: () {
        Get.back();
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(
          color: Color(0xFF004D41),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text("Cancel"),
    ),
    confirm: OutlinedButton(
      onPressed: () {
        Get.back();
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color(0xFFABD02B),
        side: const BorderSide(
          color: Color(0xFFABD02B),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text("Confirm"),
    ),
  );
}
