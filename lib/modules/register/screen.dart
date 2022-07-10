import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import '../../common/common.dart';

class RegisterScreen extends GetView<RegisterController> {
  RegisterScreen({Key? key}) : super(key: key);

  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return ScaffoldFormWidget(
      title: 'Register',
      subTitle: Text(
        'Let’s create account',
        style: _textTheme.bodyText2!.textBlack44350D0p6,
      ),
      form: Column(
        children: [
          TextFormFieldPhoneNumber(
            title: 'Phone number',
            isRequire: true,
            onChanged:controller.validatorPhone,
            callBackCountryCode: (val) {
              controller.countryCode = val.dialCode ?? '-';
            },
            validator: controller.validatePhoneNumber,
          ),
          40.verticalSpace,
          Obx(
            () => ButtonStateWidget(
              onPressed: controller.onTapRegister,
              state: controller.stateButton.value,
            ),
          ),
        ],
      ),
    );
  }
}
