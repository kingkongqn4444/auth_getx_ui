import 'package:base_flutter_app/biz/biz.dart';
import 'package:base_flutter_app/common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'widget/widget.dart';

class ProfileController extends GetxController with FormValidator {
  String fistName = 'Thinh',
      lastName = 'Nguye',
      password = '',
      email = 'nguyenhungthinh16@gmail.com';

  DateTime birthDay = DateTime.now();
  String gender = 'Male';
  final stateEmail = 0.obs;

  /// 0 not verify  , 1 check email, 2 verify
  final buttonActive = false.obs;

  void validator() {
    if (fieldCantEmpty(fistName) == null &&
        fieldCantEmpty(lastName) == null &&
        fieldCantEmpty(email) == null) {
      buttonActive.value = true;
    } else {
      buttonActive.value = false;
    }
  }

  ///change phone number

  final stateButtonOTPST2 = ButtonStateEnum.hide.obs;
  final stateButtonOTPST4 = ButtonStateEnum.hide.obs;

  void changePhoneNumber() {
    Get.dialog(DialogConfirmChangePhone(onConfirm: _onTapConfirmChange));
  }

  void _onTapConfirmChange() {
    Get.dialog(
      DialogVerifyOTPChangePhone(
        validatorOTP: _validatorOTPST2,
        buttonState: stateButtonOTPST2,
        step: 2,
        onTapVerifyOTP: () {
          Get.dialog(DialogNewPhone(onTapNext: _onTapNextStepChangePhone));
        },
      ),
    );
  }

  void _onTapNextStepChangePhone() {
    Get.dialog(
      DialogVerifyOTPChangePhone(
        validatorOTP: _validatorOTPST4,
        buttonState: stateButtonOTPST4,
        step: 4,
        onTapVerifyOTP: () {
          Get.dialog(DialogCompletedChangePhone());
        },
      ),
    );
  }

  void _validatorOTPST2(String val) {
    if (val.length == 4) {
      stateButtonOTPST2.value = ButtonStateEnum.active;
    } else {
      stateButtonOTPST2.value = ButtonStateEnum.hide;
    }
  }

  void _validatorOTPST4(String val) {
    if (val.length == 4) {
      stateButtonOTPST4.value = ButtonStateEnum.active;
    } else {
      stateButtonOTPST4.value = ButtonStateEnum.hide;
    }
  }

  void _onTapVerifyOTPST2() {
    stateButtonOTPST2.value = ButtonStateEnum.loading;
    Future.delayed(2.seconds, () {
      //Get.to(() => ChangeNewPassScreen());
      stateButtonOTPST2.value = ButtonStateEnum.active;
    });
  }

  void _onTapVerifyOTPST4() {
    stateButtonOTPST4.value = ButtonStateEnum.loading;
    Future.delayed(2.seconds, () {
      //Get.to(() => ChangeNewPassScreen());
      stateButtonOTPST4.value = ButtonStateEnum.active;
    });
  }
}
