import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'biz/biz.dart';
import 'repository/repository.dart';
import 'routes/routes.dart';
import 'theme/theme_data.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
    );
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    final initialBinding = BindingsBuilder(() {
      Get.put(AppService());
      Get.lazyPut<ISampleRepository>(() => SampleRepository(), fenix: true);
      Get.put(AppController());
    });

    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 45.0
      ..radius = 10
      ..progressColor = Colors.white
      ..backgroundColor = Colors.transparent
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskType = EasyLoadingMaskType.clear
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: BaseAppThemeData.themeData,
      getPages: AppPages.pages,
      initialBinding: initialBinding,
      builder: EasyLoading.init(
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
      ),
      defaultTransition: Transition.native,
      initialRoute: Routes.loginType,
    );
  }
}
