import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBarSuccess({required String title, required String message}) {
  Get.snackbar(
    title,
    message,
    duration: 2.seconds,
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    backgroundColor: Colors.green,
    colorText: Colors.white,
  );
}
