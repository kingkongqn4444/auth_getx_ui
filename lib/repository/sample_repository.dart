import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_service.dart';

abstract class ISampleRepository {
  Future<bool> sample();
}

class SampleRepository implements ISampleRepository {
  AppService get _appService => Get.find();

  @override
  Future<bool> sample() async {
    try {
      final res = await _appService.post('sample');
      if (res.isSuccess) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }
}
