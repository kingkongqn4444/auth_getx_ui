import 'package:base_flutter_app/biz/biz.dart';
import 'package:base_flutter_app/common/common.dart';
import 'package:base_flutter_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterInfoController extends GetxController with FormValidator {
  String fistName = '', lastName = '', password = '', email = '';
  late DateTime birthDay;
  String gender = 'Male';
  final stateButton = ButtonStateEnum.hide.obs;

  final type = TypeVerifyEnum.register.obs;

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is TypeVerifyEnum) {
      type.value = Get.arguments;
    }
    super.onInit();
  }

  void onTapRegister() {
    stateButton.value = ButtonStateEnum.loading;
    Future.delayed(4.seconds, () {
      stateButton.value = ButtonStateEnum.active;
      Get.offAllNamed(Routes.loginByUser,
          arguments: {'phoneNumber': '0986562277'},
          // ignore: unrelated_type_equality_checks
          predicate: (route) => route == Routes.loginByUser);
    });
  }

  void validator() {
    if (type.value == TypeVerifyEnum.updateInfo) {
      if (fieldCantEmpty(fistName) == null && fieldCantEmpty(lastName) == null) {
        stateButton.value = ButtonStateEnum.active;
      } else {
        stateButton.value = ButtonStateEnum.hide;
      }
    } else {
      if (fieldCantEmpty(fistName) == null &&
          fieldCantEmpty(lastName) == null &&
          validatePass(password) == null) {
        stateButton.value = ButtonStateEnum.active;
      } else {
        stateButton.value = ButtonStateEnum.hide;
      }
    }
  }
}
