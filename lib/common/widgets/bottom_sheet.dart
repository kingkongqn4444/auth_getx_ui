import 'package:base_flutter_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/common/common.dart';

class BaseBottomSheet extends StatelessWidget {
  final String title;
  final Widget child;
  final double? contentPadding;

  BaseBottomSheet({Key? key, required this.title, required this.child, this.contentPadding})
      : super(key: key);

  final _textTheme = Get.textTheme;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          topLeft: Radius.circular(32),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTitle(),
          12.verticalSpace,
          Padding(padding: EdgeInsets.symmetric(horizontal: contentPadding ?? 16), child: child),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          45.horizontalSpace,
          Text(
            title,
            style: _textTheme.subtitle1!.semiBold,
          ),
          IconButton(
            icon:  Icon(
              Icons.close,
              color: AssetColors.black44350D0p32,
            ),
            onPressed: Get.back,
          ).wrapWidth(45),
        ],
      ),
    );
  }
}
