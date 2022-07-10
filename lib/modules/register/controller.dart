import 'package:base_flutter_app/biz/biz.dart';
import 'package:base_flutter_app/common/common.dart';
import 'package:base_flutter_app/routes/routes.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController with FormValidator {
  String countryCode = '+84';
  String _phoneNumber = '';
  final stateButton = ButtonStateEnum.hide.obs;

  void onTapRegister() {
    stateButton.value = ButtonStateEnum.loading;
    Future.delayed(4.seconds, () {
      stateButton.value = ButtonStateEnum.active;
      Get.toNamed(Routes.verifyOTPRegister);
    });
  }

  void validatorPhone(String val){
    _phoneNumber=val;
    if(validatePhoneNumber(val)==null){
      stateButton.value = ButtonStateEnum.active;
    }else{
      stateButton.value = ButtonStateEnum.hide;
    }
  }
}
