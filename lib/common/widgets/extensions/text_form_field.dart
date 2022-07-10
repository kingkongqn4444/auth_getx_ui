import 'package:base_flutter_app/common/common.dart';
import 'package:flutter/material.dart';

extension TextFormExt on TextFormField {
  Widget custom({required String title, bool isRequire = false}) {
    return Stack(
      children: [
        paddingOnly(top: 10),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          margin: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: Get.textTheme.subtitle2!.textBlack44350D0p6),
              2.horizontalSpace,
              if (isRequire)
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
}
