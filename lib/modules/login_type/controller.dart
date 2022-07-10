import 'package:base_flutter_app/models/models.dart';
import 'package:base_flutter_app/routes/routes.dart';
import 'package:get/get.dart';

class LoginTypeController extends GetxController {
  final types = [
    TypeLoginModel(icon: 'ic_google', title: 'Continue with Google', actionId: 1),
    TypeLoginModel(icon: 'ic_apple', title: 'Continue with Apple', actionId: 2),
    TypeLoginModel(icon: 'ic_mcsf', title: 'Continue with Microsoft', actionId: 3),
    TypeLoginModel(icon: 'ic_phone', title: 'Continue with Phone Number', actionId: 4),
    TypeLoginModel(icon: 'ic_user', title: 'Continue with Username', actionId: 5),
  ];

  void onTapType(int actionId) {
    switch (actionId) {
      case 5:
        Get.toNamed(Routes.loginByUser);
        break;
      case 2:
      case 3:
      case 4:
      case 1:
        Get.toNamed(Routes.loginSocial);
        break;
      default:
        Get.toNamed(Routes.loginByUser);
        break;
    }
  }

  void onTapRegister() {
    Get.toNamed(Routes.register);
  }
}
