import 'package:base_flutter_app/biz/biz.dart';
import 'package:base_flutter_app/common/common.dart';
import 'package:base_flutter_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class DialogVerifyOTPChangePhone extends StatelessWidget {
  final VoidCallback? onTapVerifyOTP;
  final Function(String) validatorOTP;
  final Rx<ButtonStateEnum> buttonState;
  final int step;

  DialogVerifyOTPChangePhone(
      {Key? key,required this.step, this.onTapVerifyOTP, required this.validatorOTP, required this.buttonState})
      : super(key: key);

  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return BaseDialogStep(
      title: 'OTP authentication',
      step: step,
      totalStep: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
                text: 'OTP code has been sent to\n',
                style: _textTheme.bodyText2!.textBlack44350D0p6,
                children: [
                  TextSpan(
                    text: '0123 456 7890',
                    style: _textTheme.subtitle2!.textBlack44350D0p6,
                  )
                ]),
          ),
          Text.rich(
            TextSpan(
                text: 'Enter OTP code ',
                style: _textTheme.bodyText2!.textBlack44350D0p6,
                children: [
                  TextSpan(
                    text: 'to save new Phone number',
                    style: _textTheme.subtitle2!.textBlack44350D0p6,
                  )
                ]),
          ),
          16.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _pinCodeWidget(),
              ),
              20.horizontalSpace,
              Obx(
                () => ButtonStateWidget(
                  onPressed: (){
                    Get.back();
                    onTapVerifyOTP?.call();
                  },
                  state: buttonState.value,
                ).wrapSize(50, 50),
              )
            ],
          ),
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
          shape: PinCodeFieldShape.box,
          fieldHeight: 50,
          fieldWidth: 40,
          borderWidth: 1,
          borderRadius: BorderRadius.circular(16),
          fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 2),
          inactiveColor: AssetColors.primaryTwo,
          selectedColor: AssetColors.primaryTwo,
          activeColor: AssetColors.greyE8E8E8,
          disabledColor: Colors.transparent),
      cursorColor: AssetColors.primaryTwo,
      animationDuration: 250.milliseconds,
      enableActiveFill: false,
      keyboardType: TextInputType.number,
      onChanged: validatorOTP,
      beforeTextPaste: (text) {
        debugPrint("Allowing to paste $text");
        return true;
      },
    );
  }
}
