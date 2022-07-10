import '../repository/repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'constants.dart';

class AppController extends GetxController {
  AppService get _appService => Get.find();
  final _stg = GetStorage();

  void logout() {
    //Get.offAllNamed(Routes.start);
    Get.until((route) => route.isFirst);
    _clearStorage();
  }

  Future<void> _clearStorage() async {
    _appService.setToken(null);
    _stg.remove(AppConstants.keyUser);
  }
}
