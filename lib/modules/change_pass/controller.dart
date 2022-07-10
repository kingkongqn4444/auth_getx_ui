import 'package:base_flutter_app/biz/biz.dart';
import 'package:base_flutter_app/common/common.dart';
import 'package:base_flutter_app/modules/change_pass/step_new_pass.dart';
import 'package:base_flutter_app/modules/change_pass/step_verify_otp.dart';
import 'package:get/get.dart';

class ChangePassController extends GetxController with FormValidator {
  String currentPass = '';
  final isValidatorCurrent = false.obs;
  final stateButtonOTP = ButtonStateEnum.hide.obs;
  final stateButtonNewPass = ButtonStateEnum.hide.obs;

  void onTapNextStepVerify() {
    Get.to(VerifyOTPChangePassScreen());
  }

  void onTapVerifyOTP() {
    stateButtonOTP.value = ButtonStateEnum.loading;
    Future.delayed(2.seconds, () {
      Get.to(() => ChangeNewPassScreen());
      stateButtonOTP.value = ButtonStateEnum.active;
    });
  }

  void validatorOTP(String val) {
    if (val.length == 4) {
      stateButtonOTP.value = ButtonStateEnum.active;
    } else {
      stateButtonOTP.value = ButtonStateEnum.hide;
    }
  }

  void onTapCreateNewPass() {
    stateButtonNewPass.value = ButtonStateEnum.loading;
    Future.delayed(2.seconds, () {
      Get.close(3);
    });
  }

  void validator(String val) {
    if (validatePass(val) == null) {
      stateButtonNewPass.value = ButtonStateEnum.active;
    } else {
      stateButtonNewPass.value = ButtonStateEnum.hide;
    }
  }
}
