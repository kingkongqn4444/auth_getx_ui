import 'package:base_flutter_app/models/models.dart';
import 'package:base_flutter_app/theme/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import '../../common/common.dart';

class LoginTypeScreen extends GetView<LoginTypeController> {
  LoginTypeScreen({Key? key}) : super(key: key);

  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img_bg'.assetPathPNG),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good morning,',
              style: _textTheme.headline4!.textWhite,
            ),
            8.verticalSpace,
            Text(
              'Enjoy the convenience',
              style: _textTheme.bodyText2!.textWhite,
            ),
            24.verticalSpace,
            _buildForm(),
            const Spacer(),
            Center(
              child: Text(
                'Version 1.1.0',
                style: _textTheme.bodyText2!.textWhite0p6,
              ),
            ),
            10.verticalSpace,
          ],
        )),
      ),
    );
  }

  Widget _buildForm() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Log in',
              style: _textTheme.headline5,
            ),
            16.verticalSpace,
            Container(width: 35, height: 2, color: AssetColors.yellowD3A429),
            24.verticalSpace,
            _buildContainerType(),
            40.verticalSpace,
          ],
        ).wrapCard.paddingOnly(bottom: 40),
        Image.asset('ic_fingerprint'.assetPathIconPNG,height: 80,)
      ],
    );
  }

  Widget _buildContainerType() {
    return Column(
      children: [
        ...controller.types.map((e) => _buildItemType(e).paddingSymmetric(vertical: 6)),
        18.verticalSpace,
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Don’t have an account ? ',
              style: _textTheme.bodyText2!.textBlack44350D0p32,
              children: [
                TextSpan(
                  text: 'Register',
                  style: _textTheme.subtitle2!.textPrimary,
                  recognizer: TapGestureRecognizer()..onTap = () {
                    controller.onTapRegister();
                  },
                ),
              ]),
        ),
      ],
    );
  }

  Widget _buildItemType(TypeLoginModel model) {
    return InkWell(
      onTap: () => controller.onTapType(model.actionId),
      child: Container(
        width: double.infinity,
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AssetColors.greyE8E8E8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              model.icon.assetPathIconPNG,
              width: 22,
            ),
            Text(model.title, style: _textTheme.bodyText2),
            22.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
