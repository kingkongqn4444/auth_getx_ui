import 'package:base_flutter_app/modules/modules.dart';
import 'package:base_flutter_app/theme/asset_colors.dart';
import 'package:base_flutter_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/common/common.dart';

class ContainerProfileEmail extends StatelessWidget {
  final ProfileController controller;

  ContainerProfileEmail(this.controller, {Key? key}) : super(key: key);

  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue: controller.email,
          decoration: InputDecoration(
            hintText: 'Enter email',
            suffixIcon: Obx(
              () => controller.stateEmail.value == 2
                  ? Image.asset(
                      'ic_circle_check'.assetPathIconPNG,
                      width: 10,
                    ).paddingOnly(left: 15, right: 15)
                  : const SizedBox(),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (val) {
            controller.email = val;
            controller.validator();
          },
        ).custom(title: 'Email'),
        8.verticalSpace,
        Obx(() {
          if (controller.stateEmail.value == 0) {
            return _buildVerify();
          }
          if (controller.stateEmail.value == 1) {
            return _buildCheckMail();
          }
          return const SizedBox();
        })
      ],
    );
  }

  Widget _buildVerify() {
    return Row(
      children: [
        Image.asset(
          'ic_warning'.assetPathIconPNG,
          width: 18,
        ),
        8.horizontalSpace,
        Text('Unveried ●', style: _textTheme.bodyText2!.textBlack44350D0p6),
        8.horizontalSpace,
        InkWell(
          onTap: () => controller.stateEmail.value = 1,
          child: Text('Unveried', style: _textTheme.subtitle2!.textPrimary),
        ),
      ],
    );
  }

  Widget _buildCheckMail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Please check your email for confirmation',
            style: _textTheme.bodyText2!.textBlack44350D0p6),
        InkWell(
          onTap: () => controller.stateEmail.value = 2,
          child: Text('Open email app', style: _textTheme.subtitle2!.textPrimary),
        ),
      ],
    );
  }
}
