import 'package:base_flutter_app/modules/account/widget/item_feature.dart';
import 'package:base_flutter_app/modules/account/widget/item_login_type.dart';
import 'package:base_flutter_app/routes/routes.dart';
import 'package:base_flutter_app/theme/asset_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import '../../common/common.dart';

class AccountScreen extends GetView<AccountController> {
  AccountScreen({Key? key}) : super(key: key);
  final _textTheme = Get.textTheme;
  @override
  Widget build(BuildContext context) {
    return ScaffoldAppbarWidget(
      appBar: _buildAppBar(),
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContainerOne(),
            20.verticalSpace,
            _buildContainerTwo(),
            20.verticalSpace,
            Text(
              'login with'.toUpperCase(),
              style: _textTheme.subtitle1!.textBlack44350D0p32.letterSpaC(0.8),
            ),
            10.verticalSpace,
            _buildContainerThree(),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(1.5),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: const CachedImageNetworkWidget(
              url:
                  'https://kenh14cdn.com/thumb_w/660/2017/75614297jw1faoy1g9cnlj21og23je84-1509002837953.jpg',
            ),
          ),
        ),
        12.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nguyễn Hưng Thịnh',
                style: _textTheme.subtitle2!.textWhite,
              ),
              Text(
                'Ariana house',
                style: _textTheme.bodyText2!.textWhite,
              ),
            ],
          ),
        ),
        10.horizontalSpace,
        InkWell(
          onTap: () => Get.toNamed(Routes.profile),
          child: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
          ),
        ),
      ],
    ).wrapHeight(40);
  }

  Widget _buildContainerOne() {
    return Column(
      children: [
        ItemFeatureAccount(
          title: 'Change password',
          icon: 'ic_lock',
          onTap: () => Get.toNamed(Routes.changePass),
        ),
        const Divider(height: 24),
        ItemFeatureAccount(
          title: 'Change language',
          icon: 'ic_language',
          onTap: controller.onTapChangeLanguage,
          rightWidget: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AssetColors.yellowD3A429,
          ),
        ),
        const Divider(height: 24),
        ItemFeatureAccount(
          title: 'Display',
          icon: 'ic_display',
          rightWidget: const Icon(
            Icons.keyboard_arrow_down_outlined,
            color: AssetColors.yellowD3A429,
          ),
          onTap: () {},
        ),
      ],
    ).wrapCard;
  }

  Widget _buildContainerTwo() {
    return Column(
      children: [
        ItemFeatureAccount(
          title: 'Terms & condition',
          icon: 'ic_doc',
          onTap: controller.onTapTermsOfUse,
        ),
        const Divider(height: 24),
        ItemFeatureAccount(
          title: 'Notification setting',
          icon: 'ic_noti',
          onTap: controller.onTapNotificationSetting,
        ),
        const Divider(height: 24),
        ItemFeatureAccount(
          title: 'System notification setting',
          icon: 'ic_setting',
          onTap: () {},
        ),
      ],
    ).wrapCard;
  }

  Widget _buildContainerThree() {
    return Obx(() => Column(
          children: [
            ItemFeatureAccount(
              title: 'Touch ID ',
              icon: 'ic_touch_id',
              rightWidget: CupertinoSwitch(
                value: controller.touchId.value,
                activeColor: AssetColors.primaryTwo,
                onChanged: controller.touchId,
              ),
            ),
            24.verticalSpace,
            ItemFeatureAccount(
              title: 'Face ID ',
              icon: 'ic_face_id',
              rightWidget: CupertinoSwitch(
                value: controller.faceId.value,
                activeColor: AssetColors.primaryTwo,
                onChanged: controller.faceId,
              ),
            ),
            const Divider(height: 32),
            ItemLoginType(
              title: 'Google',
              icon: 'ic_google',
              isActive: controller.loginGoogle.value,
              callBack: controller.loginGoogle,
            ),
            16.verticalSpace,
            ItemLoginType(
              title: 'Apple',
              icon: 'ic_apple',
              isActive: controller.loginApple.value,
              callBack: controller.loginApple,
            ),
            16.verticalSpace,
            ItemLoginType(
              title: 'Microsoft',
              icon: 'ic_mcsf',
              isActive: controller.loginMicrosoft.value,
              callBack: controller.loginMicrosoft,
            ),
            16.verticalSpace,
            ItemLoginType(
              title: 'Phone number',
              icon: 'ic_phone',
              isActive: controller.loginPhoneNumber.value,
              callBack: controller.loginPhoneNumber,
            ),
            16.verticalSpace,
            ItemLoginType(
              title: 'Username',
              icon: 'ic_user',
              isActive: controller.loginUserName.value,
              callBack: controller.loginUserName,
            ),
            16.verticalSpace,
          ],
        ).wrapCard);
  }
}
