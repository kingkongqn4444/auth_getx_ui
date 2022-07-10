import 'package:base_flutter_app/common/common.dart';
import 'package:flutter/material.dart';

class DialogCompletedChangePhone extends StatelessWidget {
  final _textTheme = Get.textTheme;

  DialogCompletedChangePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseDialogStep(
      title: 'Complete !',
      step: 5,
      totalStep: 5,
      child: Column(
        children: [
          Image.asset('ic_success'.assetPathIconGIF).paddingSymmetric(horizontal: 30),
          16.verticalSpace,
          Text(
            'Save new Phone Number\nsuccessfully !',
            style: _textTheme.subtitle1!.semiBold,
            textAlign: TextAlign.center,
          ),
          8.verticalSpace,
          RichText(
            textAlign: TextAlign.center,
            text:
                TextSpan(text: 'Saved ', style: _textTheme.bodyText2!.textBlack44350D0p6, children: [
              TextSpan(
                text: '0986 678 222',
                style: _textTheme.subtitle2!.textBlack44350D0p6,
              ),
            ]),
          ),
          32.verticalSpace,
          const Text('Cancel').outlinedButton(onPressed: Get.back).fullWidth,
        ],
      ),
    );
  }
}
