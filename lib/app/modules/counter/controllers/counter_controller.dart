import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  //TODO: Implement CounterController

  final count = 0.obs;

  void increment() {
    if (count.value < 50) {
      count.value++;
    } else {
      Get.snackbar(
        "Stop!",
        "Nilai sudah mencapai 10",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void decrement() {
    if (count.value > 0) {
      count.value--;
    } else {
      Get.snackbar(
        "Stop!!",
        "Nilai sudah 0",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.black,
      );
    }
  }
}
