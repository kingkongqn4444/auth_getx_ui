import 'package:base_flutter_app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/common/common.dart';

class ItemLoginType extends StatelessWidget {
  final String title;
  final String icon;
  final bool isActive;
  final Function(bool)? callBack;

  const ItemLoginType(
      {Key? key,
      required this.title,
      required this.icon,
      this.isActive = false,
      this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
              color: AssetColors.black44350D.withOpacity(0.04), shape: BoxShape.circle),
          child: Image.asset(icon.assetPathIconPNG),
        ),
        12.horizontalSpace,
        Expanded(child: Text(title, style: Get.textTheme.bodyText2)),
        10.horizontalSpace,
        CupertinoSwitch(
          value: isActive,
          activeColor: AssetColors.primaryTwo,
          onChanged: callBack,
        ),
      ],
    );
  }
}
