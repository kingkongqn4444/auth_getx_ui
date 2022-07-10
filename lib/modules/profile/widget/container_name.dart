import 'package:base_flutter_app/modules/modules.dart';
import 'package:base_flutter_app/theme/asset_colors.dart';
import 'package:base_flutter_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/common/common.dart';

class ContainerProfileName extends StatelessWidget {
  final ProfileController controller;

  ContainerProfileName(this.controller, {Key? key}) : super(key: key);

  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: controller.fistName,
                onChanged: (val) {
                  controller.fistName = val;
                  controller.validator();
                },
                decoration: const InputDecoration(hintText: 'Enter first name'),
              ).custom(title: 'First Name', isRequire: true),
            ),
            12.horizontalSpace,
            Expanded(
              child: TextFormField(
                initialValue: controller.lastName,
                onChanged: (val) {
                  controller.lastName = val;
                  controller.validator();
                },
                decoration: const InputDecoration(hintText: 'Enter last name'),
              ).custom(title: 'LastName', isRequire: true),
            ),
          ],
        ),
        16.verticalSpace,
        _buildShowName(),
      ],
    );
  }

  Widget _buildShowName() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AssetColors.greyF2F2F2),
          child: Column(
            children: [
              _buildItemFullName(name: 'Nguyen Hung Thinh', isSelected: true),
              _buildItemFullName(name: 'Thinh Nguyen Hung'),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          margin: const EdgeInsets.only(left: 15),
          child: Text('Full name',
              style: Get.textTheme.subtitle2!.textBlack44350D0p6),
        )
      ],
    );
  }

  Widget _buildItemFullName({required String name, bool isSelected = false}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        name,
        style: _textTheme.bodyText2!.textColor(
            isSelected ? AssetColors.black44350D : AssetColors.black44350D0p32),
      ),
    );
  }
}
