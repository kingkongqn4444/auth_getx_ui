import 'package:base_flutter_app/theme/asset_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import '../../common/common.dart';

class ChangePassScreen extends GetView<ChangePassController> {
  const ChangePassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldFormStepWidget(
      title: 'Enter current password',
      step: 1,
      totalStep: 3,
      isStrikethrough: true,
      form: Obx(() => TextFormField(
            obscuringCharacter: '●',
            onChanged: (val) {
              controller.currentPass = val;
              controller.isValidatorCurrent.value = controller.validatePass(val) == null;
            },
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              suffixIcon: InkWell(
                onTap: controller.isValidatorCurrent.value ? controller.onTapNextStepVerify : null,
                child: Image.asset(
                  'ic_check'.assetPathIconPNG,
                  width: 5,
                  color: controller.isValidatorCurrent.value ? AssetColors.primaryTwo : Colors.grey,
                ).paddingOnly(right: 15, left: 15),
              ),
            ),
          ).custom(title: 'Current password')),
    );
  }
}
