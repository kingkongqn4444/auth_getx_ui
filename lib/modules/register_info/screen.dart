import 'package:base_flutter_app/biz/biz.dart';
import 'package:base_flutter_app/modules/register_info/widget/widget.dart';
import 'package:base_flutter_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import '../../common/common.dart';

class RegisterInfoScreen extends GetView<RegisterInfoController> {
  const RegisterInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldFormWidget(
      title: 'Register information',
      form: Column(
        children: [
          _buildAvatar(),
          12.verticalSpace,
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  onChanged: (val) {
                    controller.fistName = val;
                    controller.validator();
                  },
                  validator: (val) => controller.fieldCantEmpty(val),
                  decoration: const InputDecoration(hintText: 'Enter first name'),
                ).custom(title: 'First Name', isRequire: true),
              ),
              12.horizontalSpace,
              Expanded(
                child: TextFormField(
                  onChanged: (val) {
                    controller.lastName = val;
                    controller.validator();
                  },
                  decoration: const InputDecoration(hintText: 'Enter last name'),
                ).custom(title: 'LastName', isRequire: true),
              ),
            ],
          ),
          12.verticalSpace,
          Obx(() {
            if (controller.type.value == TypeVerifyEnum.updateInfo) {
              return const SizedBox();
            }
            return TextFieldPassWidget(controller).paddingOnly(bottom: 12);
          }),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Enter email'),
            keyboardType: TextInputType.emailAddress,
            onChanged: (val) {
              controller.email = val;
              controller.validator();
            },
          ).custom(title: 'Email'),
          12.verticalSpace,
          ContainerGender(
            onChanged: (val) => controller.gender == val,
          ),
          12.verticalSpace,
          TextFormFieldDateTime(
            title: 'Birthday',
            onChanged: (val) {
              controller.birthDay = val;
              controller.validator();
            },
          ),
          40.verticalSpace,
          Obx(
            () => ButtonStateWidget(
              onPressed: controller.onTapRegister,
              state: controller.stateButton.value,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 100,
          height: 100,
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AssetColors.black44350D.withOpacity(0.2), Colors.transparent],
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: const CachedImageNetworkWidget(
              url:
                  'https://kenh14cdn.com/thumb_w/660/2017/75614297jw1faoy1g9cnlj21og23je84-1509002837953.jpg',
            ),
          ),
        ),
        Image.asset('ic_change_avatar'.assetPathIconPNG, width: 36),
      ],
    );
  }
}
