import 'package:base_flutter_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/common/common.dart';

class ItemFeatureAccount extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String icon;
  final Widget? rightWidget;

  const ItemFeatureAccount(
      {Key? key, this.onTap, required this.title, required this.icon, this.rightWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
                color: AssetColors.yellowD3A429.withOpacity(0.12), shape: BoxShape.circle),
            child: Image.asset(icon.assetPathIconPNG),
          ),
          12.horizontalSpace,
          Expanded(child: Text(title, style: Get.textTheme.bodyText2)),
          10.horizontalSpace,
          if (rightWidget != null) rightWidget!
        ],
      ),
    );
  }
}
