import 'package:base_flutter_app/theme/asset_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import '../../common/common.dart';

class TermsOfUseScreen extends GetView<TermsOfUseController> {
  TermsOfUseScreen({Key? key}) : super(key: key);

  final _textTheme = Get.textTheme;

  @override
  Widget build(BuildContext context) {
    return ScaffoldAppbarWidget(
      title: 'Terms of use',
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildDate(),
            16.verticalSpace,
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
              style: _textTheme.bodyText2,
            ).paddingSymmetric(horizontal: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'ic_terms_of_use'.assetPathIconPNG,
          width: 86,
        ),
        12.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Terms of use', style: _textTheme.subtitle1!.semiBold),
              Text(
                  'The page you’re looking for is currently under maintenance and will be come back soon',
                  style: _textTheme.overline!.letterSpaC(0).heightLine(22).textBlack44350D0p6),
            ],
          ),
        )
      ],
    ).paddingAll(16);
  }

  Widget _buildDate() {
    return Container(
      width: double.infinity,
      height: 40,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: AssetColors.black44350D.withOpacity(0.04),
      child: Text(
        'Updated ${DateTime.now().formatDateMMMMddYYY}',
        style: _textTheme.overline!.textBlack44350D0p32.medium,
      ),
    );
  }
}
