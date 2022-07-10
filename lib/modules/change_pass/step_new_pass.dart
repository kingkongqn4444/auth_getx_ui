import 'package:base_flutter_app/theme/asset_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import '../../common/common.dart';

class ChangeNewPassScreen extends GetView<ChangePassController> {
  ChangeNewPassScreen({Key? key}) : super(key: key);
  final _textTheme = Get.textTheme;
  @override
  Widget build(BuildContext context) {
    return ScaffoldFormStepWidget(
        title: 'Create new password',
        step: 3,
        totalStep: 3,
        isStrikethrough: true,
        form: Column(
          children: [
            TextFormFieldPassword(
              title: 'New password',
              onChanged: controller.validator,
            ),
            12.verticalSpace,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: AssetColors.black44350D0p08, width: 2),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _itemCondition(title: 'Chứa ít nhất 8 ký tự'),
                  8.verticalSpace,
                  _itemCondition(
                      title: 'Chứa ký tự viết thường (a-z) và ký tự viết HOA (A-Z)', isDot: true),
                  8.verticalSpace,
                  _itemCondition(title: 'Chứa ít nhất 1 số (0-9)', isDot: true),
                ],
              ),
            ),
            40.verticalSpace,
            Obx(
              () => ButtonStateWidget(
                onPressed: controller.onTapCreateNewPass,
                state: controller.stateButtonNewPass.value,
              ),
            ),
          ],
        ));
  }

  Widget _itemCondition({required String title, bool isDot = false}) {
    return Row(
      children: [
        if (isDot)
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AssetColors.black44350D0p32,
            ),
          )
        else
          Image.asset('ic_check'.assetPathIconPNG, width: 10),
        8.horizontalSpace,
        Expanded(
          child: Text(title, style: _textTheme.bodyText2!.textBlack44350D0p6),
        )
      ],
    );
  }
}
