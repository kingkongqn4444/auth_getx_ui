import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import '../../common/common.dart';

class LoginSocialScreen extends GetView<LoginSocialController> {
  LoginSocialScreen({Key? key}) : super(key: key);

  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return ScaffoldFormWidget(
      title: 'Get started',
      form: Column(
        children: [
          TextFormFieldPhoneNumber(
            title: 'Phone number',
            isRequire: true,
            onChanged: controller.validatorPhone,
            callBackCountryCode: (val) {
              controller.countryCode = val.dialCode ?? '-';
            },
            validator: controller.validatePhoneNumber,
          ),
          40.verticalSpace,
          Obx(
            () => ButtonStateWidget(
              onPressed: controller.onTapLogin,
              state: controller.stateButton.value,
            ),
          ),
        ],
      ),
    );
  }
}
