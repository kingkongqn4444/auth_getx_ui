import 'package:base_flutter_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/common/common.dart';
import 'package:flutter/services.dart';

class ScaffoldFormWidget extends StatelessWidget {
  final String title;
  final Widget? subTitle;
  final Widget form;

  ScaffoldFormWidget({Key? key, required this.title, this.subTitle, required this.form})
      : super(key: key);

  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('img_bg'.assetPathPNG),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        _buildButtonBack(),
                        const Spacer(),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      'Version 1.1.0',
                      style: _textTheme.bodyText2!.textWhite0p6,
                    ),
                    10.verticalSpace,
                  ],
                ).paddingSymmetric(horizontal: 16),
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: _textTheme.headline5,
                        ),
                        if (subTitle != null) subTitle!.paddingOnly(top: 8),
                        16.verticalSpace,
                        Container(width: 35, height: 2, color: AssetColors.yellowD3A429),
                        16.verticalSpace,
                        form
                      ],
                    ),
                  ).fullWidth.wrapCard,
                ).marginOnly(
                    top: 60,
                    bottom: MediaQuery.of(context).viewInsets.bottom == 0 ? 60 : 0,
                    left: 16,
                    right: 16)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonBack() {
    return InkWell(
      onTap: Get.back,
      child: Container(
        width: 36,
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: const Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.black,
          size: 18,
        ),
      ),
    );
  }
}

class ScaffoldAppbarWidget extends StatelessWidget {
  final Widget? appBar;
  final String? title;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const ScaffoldAppbarWidget({Key? key, this.appBar, this.title, required this.child, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.topCenter,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage('img_header_bg'.assetPathPNG),
              fit: BoxFit.contain,
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                8.verticalSpace,
                if (appBar != null)
                  appBar!.paddingSymmetric(horizontal: 16)
                else
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: Get.back,
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                        ),
                      ),
                      12.horizontalSpace,
                      Text(
                        title ?? '',
                        style: Get.textTheme.headline5!.bold.textWhite,
                      )
                    ],
                  ).paddingSymmetric(horizontal: 16),
                8.verticalSpace,
                Expanded(
                  child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      padding: padding ?? EdgeInsets.zero,
                      decoration: const BoxDecoration(
                        color: AssetColors.whiteFAFAFA,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      child: child),
                ),
              ],
            ),
          )),
    );
  }
}

class ScaffoldFormStepWidget extends StatelessWidget {
  final String title;
  final int step;
  final int totalStep;
  final bool isStrikethrough;

  ScaffoldFormStepWidget(
      {Key? key,
      required this.title,
      required this.step,
      required this.totalStep,
      this.isStrikethrough = false,
      required this.form})
      : super(key: key);

  final Widget form;
  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('img_bg'.assetPathPNG),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        _buildButtonBack(),
                        const Spacer(),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      'Version 1.1.0',
                      style: _textTheme.bodyText2!.textWhite0p6,
                    ),
                    10.verticalSpace,
                  ],
                ).paddingSymmetric(horizontal: 16),
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        StepWidget(
                          title: title,
                          step: step,
                          total: totalStep,
                          isStrikethrough: isStrikethrough,
                        ),
                        form,
                      ],
                    ),
                  ).fullWidth.wrapCard,
                ).marginOnly(
                    top: 60,
                    bottom: MediaQuery.of(context).viewInsets.bottom == 0 ? 60 : 0,
                    left: 16,
                    right: 16)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonBack() {
    return InkWell(
      onTap: Get.back,
      child: Container(
        width: 36,
        height: 36,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: const Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.black,
          size: 18,
        ),
      ),
    );
  }
}
