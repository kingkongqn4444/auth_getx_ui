import 'package:base_flutter_app/common/common.dart';
import 'package:base_flutter_app/routes/routes.dart';
import 'package:get/get.dart';

import 'widget/widget.dart';

class AccountController extends GetxController {
  final touchId = false.obs;
  final faceId = false.obs;
  final loginGoogle = false.obs;
  final loginApple = false.obs;
  final loginMicrosoft = false.obs;
  final loginPhoneNumber = false.obs;
  final loginUserName = false.obs;

  void onTapChangeLanguage() {
    Get.bottomSheet(const BottomSheetChangeLanguage());
  }

  void onTapTermsOfUse() {
    Get.toNamed(Routes.termsOfUse);
  }

  void onTapNotificationSetting() {
    Get.toNamed(Routes.notificationSetting);
  }
}
