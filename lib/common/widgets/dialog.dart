import 'package:base_flutter_app/common/common.dart';
import 'package:base_flutter_app/theme/asset_colors.dart';
import 'package:flutter/material.dart';

class BaseDialogStep extends StatelessWidget {
  final String title;
  final int step;
  final int totalStep;
  final Widget child;

  const BaseDialogStep(
      {Key? key,
      required this.title,
      required this.step,
      required this.totalStep,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return InkWell(
      onTap: () => FocusScope.of(Get.context!).unfocus(),
      child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.all(16),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: Get.back,
                    child: Icon(
                      Icons.close,
                      size: 30,
                      color: AssetColors.black44350D0p32,
                    ),
                  )
                ],
              ),
              16.verticalSpace,
              StepWidget(title: title, step: step, total: totalStep),
              child,
            ],
          )),
    );
  }
}
