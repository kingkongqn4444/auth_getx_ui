import 'package:base_flutter_app/common/common.dart';
import 'package:base_flutter_app/theme/theme.dart';
import 'package:flutter/material.dart';

class DialogConfirmChangePhone extends StatelessWidget {
  final VoidCallback? onConfirm;

  DialogConfirmChangePhone({Key? key, this.onConfirm}) : super(key: key);

  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return BaseDialogStep(
      title: 'Confirm change phone number',
      step: 1,
      totalStep: 5,
      child: Column(
        children: [
          Image.asset('ic_fail'.assetPathIconPNG).paddingSymmetric(horizontal: 30),
          16.verticalSpace,
          Text('Change Phone Number ?', style: _textTheme.subtitle1!.semiBold),
          8.verticalSpace,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'You really want to change phone number\n',
                style: _textTheme.bodyText2!.textBlack44350D0p6,
                children: [
                  TextSpan(
                    text: '0986 678 222',
                    style: _textTheme.subtitle2!.textBlack44350D0p6,
                  ),
                ]),
          ),
          32.verticalSpace,
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Get.back();
                    onConfirm?.call();
                  },
                  style: OutlinedButton.styleFrom(
                    primary: AssetColors.redF63057,
                    side: BorderSide(
                      width: 1,
                      color: AssetColors.redF63057.withOpacity(0.5),
                    ),
                  ),
                  child: const Text('Change'),
                ),
              ),
              20.horizontalSpace,
              Expanded(
                child: const Text('Cancel').outlinedButton(onPressed: Get.back),
              ),
            ],
          )
        ],
      ),
    );
  }
}
