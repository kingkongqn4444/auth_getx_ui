import 'package:base_flutter_app/theme/asset_colors.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/common/common.dart';

class BottomSheetChangeLanguage extends StatelessWidget {
  const BottomSheetChangeLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      title: 'Select Language',
      child: Column(
        children: [
          _buildItemLang(
            title: 'Tiếng Anh',
            flag: 'img_en_lang',
            isSelected: true,
          ),
          const Divider(height: 32),
          _buildItemLang(
            title: 'Tiếng Việt',
            flag: 'img_vi_lang',
          ),
          30.verticalSpace,
        ],
      ).paddingSymmetric(horizontal: 12),
    );
  }

  Widget _buildItemLang({
    required String title,
    required String flag,
    VoidCallback? onTap,
    bool isSelected = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 32,
            height: 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: AssetImage(flag.assetPathPNG), fit: BoxFit.fill)),
          ),
          12.horizontalSpace,
          Text(
            title,
            style: Get.textTheme.bodyText2,
          ),
          const Spacer(),
          if (isSelected)
            Image.asset('ic_check'.assetPathIconPNG, width: 14, color: AssetColors.primaryTwo),
        ],
      ),
    );
  }
}
