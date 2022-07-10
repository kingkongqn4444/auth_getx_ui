import 'package:base_flutter_app/common/common.dart';
import 'package:base_flutter_app/theme/theme.dart';
import 'package:flutter/material.dart';

class DialogNewPhone extends StatelessWidget with FormValidator {
  final VoidCallback? onTapNext;

  DialogNewPhone({Key? key, this.onTapNext}) : super(key: key);

  final _showButton = false.obs;

  @override
  Widget build(BuildContext context) {
    return BaseDialogStep(
      title: 'Enter new phone number',
      step: 4,
      totalStep: 5,
      child: Column(
        children: [
          TextFormFieldPhoneNumber(
            title: 'Phone number / Username',
            isRequire: true,
            onChanged: (val) {
              _showButton.value = validatePhoneNumber(val) == null;
            },
            callBackCountryCode: (val) {},
          ),
          16.verticalSpace,
          Row(
            children: [
              Expanded(
                child: const Text('Cancel').outlinedButton(onPressed: Get.back),
              ),
              20.horizontalSpace,
              Expanded(
                child: Obx(
                  () => const Text('Next')
                      .elevatedButton(onPressed: _showButton.value ? (){
                        Get.back();
                        onTapNext?.call();
                  }: null),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
