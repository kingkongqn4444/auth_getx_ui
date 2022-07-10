import 'package:base_flutter_app/biz/biz.dart';
import 'package:base_flutter_app/common/common.dart';
import 'package:base_flutter_app/routes/routes.dart';
import 'package:get/get.dart';

class ResetPassController extends GetxController with FormValidator {
  String _newPass = '';
  final stateButton = ButtonStateEnum.hide.obs;

  void onTapChange() {
    stateButton.value = ButtonStateEnum.loading;
    Future.delayed(2.seconds, () {
      stateButton.value = ButtonStateEnum.active;
      Get.offAllNamed(Routes.loginByUser,
          arguments: {'phoneNumber': '0986562277'},
          // ignore: unrelated_type_equality_checks
          predicate: (route) => route == Routes.loginByUser);
    });
  }

  void validator(String val) {
    _newPass = val;
    if (validatePass(val) == null) {
      stateButton.value = ButtonStateEnum.active;
    } else {
      stateButton.value = ButtonStateEnum.hide;
    }
  }
}
