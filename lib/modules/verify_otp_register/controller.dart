import 'package:base_flutter_app/biz/biz.dart';
import 'package:base_flutter_app/routes/routes.dart';
import 'package:get/get.dart';

class VerifyOTPRegisterController extends GetxController {
  String _codeOTP = '';
  final stateButton = ButtonStateEnum.hide.obs;
  final isResend = false.obs;
  TypeVerifyEnum _type = TypeVerifyEnum.register;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is TypeVerifyEnum) {
      _type = Get.arguments;
    }
  }

  void validatorOTP(String val) {
    _codeOTP = val;
    if (val.length == 4) {
      stateButton.value = ButtonStateEnum.active;
    } else {
      stateButton.value = ButtonStateEnum.hide;
    }
  }

  void resendOTP() {
    stateButton.value = ButtonStateEnum.loading;
    Future.delayed(3.seconds, () {
      isResend.value = true;
      stateButton.value = ButtonStateEnum.hide;
    });
  }

  void onTapVerifyOTP() {
    stateButton.value = ButtonStateEnum.loading;
    Future.delayed(3.seconds, () {
      _actionNavigator();
      stateButton.value = ButtonStateEnum.active;
    });
  }

  void _actionNavigator() {
    if (_type == TypeVerifyEnum.register) {
      Get.toNamed(Routes.registerInfo);
      return;
    }
    if (_type == TypeVerifyEnum.forgotPass) {
      Get.toNamed(Routes.resetPassword);
      return;
    }
    Get.toNamed(Routes.registerInfo, arguments: _type);
  }
}
