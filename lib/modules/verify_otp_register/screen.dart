import 'package:base_flutter_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'controller.dart';
import '../../common/common.dart';

class VerifyOTPRegisterScreen extends GetView<VerifyOTPRegisterController> {
  final _textTheme = Get.textTheme;

  VerifyOTPRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldFormWidget(
      title: 'Confirm your phone',
      subTitle: Text.rich(
        TextSpan(
            text: 'Please enter the 4-digit code sent to\n',
            style: _textTheme.bodyText2!.textBlack44350D0p6,
            children: [
              TextSpan(
                text: '0123 456 7890',
                style: _textTheme.subtitle2!.textBlack44350D0p6,
              )
            ]),
      ),
      form: Column(
        children: [
          _pinCodeWidget(),
          20.verticalSpace,
          _buildButtonResend(),
          20.verticalSpace,
          Obx(
            () => ButtonStateWidget(
              onPressed: controller.onTapVerifyOTP,
              state: controller.stateButton.value,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonResend() {
    return Obx(
      () => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (controller.isResend.value)
            Row(
              children: [
                Text('Send', style: _textTheme.subtitle2!.textBlack44350D0p32),
                4.horizontalSpace,
                Icon(
                  Icons.check,
                  color: AssetColors.black44350D0p32,
                  size: 14,
                ),
              ],
            ).paddingOnly(right: 12),
          TextButton(onPressed: controller.resendOTP, child: const Text('Resend')),
        ],
      ),
    );
  }

  Widget _pinCodeWidget() {
    return PinCodeTextField(
      appContext: Get.context!,
      pastedTextStyle: TextStyle(
        color: Colors.green.shade600,
        fontWeight: FontWeight.bold,
      ),
      length: 4,
      autoFocus: true,
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
          fieldHeight: 50,
          fieldWidth: 50,
          fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 2),
          inactiveColor: AssetColors.greyE8E8E8,
          selectedColor: AssetColors.primaryTwo,
          activeColor: AssetColors.greyE8E8E8,
          disabledColor: Colors.transparent),
      cursorColor: AssetColors.primaryTwo,
      animationDuration: 250.milliseconds,
      enableActiveFill: false,
      keyboardType: TextInputType.number,
      onChanged: controller.validatorOTP,
      beforeTextPaste: (text) {
        debugPrint("Allowing to paste $text");
        return true;
      },
    ).paddingSymmetric(horizontal: 20);
  }
}
