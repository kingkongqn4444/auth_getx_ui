import 'package:base_flutter_app/theme/asset_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import '../../common/common.dart';

class NotificationSettingScreen extends GetView<NotificationSettingController> {
  NotificationSettingScreen({Key? key}) : super(key: key);

  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return ScaffoldAppbarWidget(
      title: 'Notification setting',
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildItem(
                    title: 'Device',
                    icon: 'ic_device',
                    isActive: controller.device.value,
                    callBack: controller.device),
                const Divider(height: 32),
                _buildItem(
                    title: 'Email',
                    icon: 'ic_email',
                    isActive: controller.email.value,
                    callBack: controller.email),
              ],
            ).wrapCard,
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
      {required String title,
      required String icon,
      bool isActive = false,
      Function(bool)? callBack}) {
    return Row(
      children: [
        Container(
          width: 30,
          alignment: Alignment.center,
          child: Image.asset(icon.assetPathIconPNG),
        ),
        22.horizontalSpace,
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
