import 'package:base_flutter_app/biz/biz.dart';
import 'package:base_flutter_app/common/common.dart';
import 'package:base_flutter_app/routes/routes.dart';
import 'package:get/get.dart';

class LoginUserController extends GetxController with FormValidator {
  String phoneNumber = '', password = '', countryCode = '+84';
  final stateButton = ButtonStateEnum.hide.obs;
  final isRemember = false.obs;

  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is Map) {
      phoneNumber = Get.arguments['phoneNumber'] ?? '';
    }
    super.onInit();
  }

  void onTapLogin() {
    stateButton.value = ButtonStateEnum.loading;
    Future.delayed(2.seconds, () {
      Get.offAndToNamed(Routes.account);
      stateButton.value = ButtonStateEnum.active;
    });
  }

  void validator() {
    if (validatePhoneNumber(phoneNumber) == null &&
        validatePass(password) == null) {
      stateButton.value = ButtonStateEnum.active;
    } else {
      stateButton.value = ButtonStateEnum.hide;
    }
  }

  void onTapForgotPass() {
    Get.toNamed(Routes.forgotPassword);
  }
}
