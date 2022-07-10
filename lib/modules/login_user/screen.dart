import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import '../../common/common.dart';

class LoginUserScreen extends GetView<LoginUserController> {
  LoginUserScreen({Key? key}) : super(key: key);
  final _textTheme = Get.textTheme;
  @override
  Widget build(BuildContext context) {
    return ScaffoldFormWidget(
      title: 'Log in with Username',
      form: Column(
        children: [
          TextFormFieldPhoneNumber(
            title: 'Phone number',
            isRequire: true,
            intValue: controller.phoneNumber,
            initCountryCode: controller.countryCode,
            onChanged: (val) {
              controller.phoneNumber = val;
              controller.validator();
            },
            callBackCountryCode: (val) {
              controller.countryCode = val.dialCode!;
            },
          ),
          12.verticalSpace,
          TextFormFieldPassword(
            title: 'Password',
            onChanged: (val) {
              controller.password = val;
              controller.validator();
            },
          ),
          18.verticalSpace,
          Row(
            children: [
              Obx(
                () => CheckBoxWidget(
                  initValue: controller.isRemember.value,
                  callBack: controller.isRemember,
                ),
              ),
              10.horizontalSpace,
              Text(
                'Remember me',
                style: _textTheme.bodyText2,
              ),
              const Spacer(),
              TextButton(onPressed: controller.onTapForgotPass, child: const Text('Forgot password?')),
            ],
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
