import 'package:base_flutter_app/modules/modules.dart';
import 'package:base_flutter_app/theme/asset_colors.dart';
import 'package:base_flutter_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/common/common.dart';

class ContainerPhoneNumberUser extends StatelessWidget {
  final VoidCallback? onChanged;

  ContainerPhoneNumberUser({Key? key, this.onChanged}) : super(key: key);

  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(16), color: AssetColors.greyF2F2F2),
          child: Row(
            children: [
              Image.asset(
                'img_vi_lang'.assetPathPNG,
                width: 20,
              ),
              6.horizontalSpace,
              Text(
                '+84',
                style: _textTheme.bodyText1!.textBlack44350D0p32,
              ),
              6.horizontalSpace,
              Icon(Icons.keyboard_arrow_down, color: AssetColors.black44350D0p32),
              Container(
                height: 20,
                width: 1,
                color: AssetColors.black44350D0p08,
                margin: const EdgeInsets.symmetric(horizontal: 12),
              ),
              Text(
                '0986568228',
                style: _textTheme.bodyText1!.textBlack44350D0p32,
              ),
              const Spacer(),
              InkWell(
                onTap: onChanged,
                child: Text(
                  'Change',
                  style: _textTheme.subtitle2!.textPrimary,
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          margin: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Phone number / Username', style: Get.textTheme.subtitle2!.textBlack44350D0p6),
              2.horizontalSpace,
              const Text(
                '*',
                style: TextStyle(color: Colors.red, fontSize: 20, height: 1),
              ),
            ],
          ),
        )
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
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(16), color: AssetColors.greyF2F2F2),
          child: Column(
            children: [
              _buildItemFullName(name: 'Le Hoang Long', isSelected: true),
              _buildItemFullName(name: 'Long Le Hoang'),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          margin: const EdgeInsets.only(left: 15),
          child: Text('Full name', style: Get.textTheme.subtitle2!.textBlack44350D0p6),
        )
      ],
    );
  }

  Widget _buildItemFullName({required String name, bool isSelected = false}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        name,
        style: _textTheme.bodyText2!
            .textColor(isSelected ? AssetColors.black44350D : AssetColors.black44350D0p32),
      ),
    );
  }
}
