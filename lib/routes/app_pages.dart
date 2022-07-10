import '../modules/modules.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

abstract class AppPages {
  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: Routes.start,
      page: () => const StartScreen(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => StartController())),
      ],
    ),
    GetPage(
      name: Routes.register,
      page: () => RegisterScreen(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => RegisterController())),
      ],
    ),
    GetPage(
      name: Routes.verifyOTPRegister,
      page: () => VerifyOTPRegisterScreen(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => VerifyOTPRegisterController())),
      ],
    ),
    GetPage(
      name: Routes.registerInfo,
      page: () => const RegisterInfoScreen(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => RegisterInfoController())),
      ],
    ),
    GetPage(
      name: Routes.loginByUser,
      page: () => LoginUserScreen(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => LoginUserController())),
      ],
    ),
    GetPage(
      name: Routes.resetPassword,
      page: () => ResetPassScreen(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => ResetPassController())),
      ],
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => ForgotScreen(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => ForgotController())),
      ],
    ),
    GetPage(
      name: Routes.loginType,
      page: () => LoginTypeScreen(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => LoginTypeController())),
      ],
    ),
    GetPage(
      name: Routes.loginSocial,
      page: () => LoginSocialScreen(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => LoginSocialController())),
      ],
    ),
    GetPage(
      name: Routes.account,
      page: () => AccountScreen(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => AccountController())),
      ],
    ),
    GetPage(
      name: Routes.termsOfUse,
      page: () => TermsOfUseScreen(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => TermsOfUseController())),
      ],
    ),
    GetPage(
      name: Routes.notificationSetting,
      page: () => NotificationSettingScreen(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => NotificationSettingController())),
      ],
    ),
    GetPage(
      name: Routes.profile,
      page: () => ProfileScreen(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => ProfileController())),
      ],
    ),
    GetPage(
      name: Routes.changePass,
      page: () => ChangePassScreen(),
      bindings: [
        BindingsBuilder(() => Get.lazyPut(() => ChangePassController())),
      ],
    ),
  ];
}
