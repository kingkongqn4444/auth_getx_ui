import 'package:base_flutter_app/modules/register_info/widget/widget.dart';
import 'package:base_flutter_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import '../../common/common.dart';
import 'widget/widget.dart';

class ProfileScreen extends GetView<ProfileController> {
  ProfileScreen({Key? key}) : super(key: key);
  final _textTheme = Get.textTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.verticalSpace,
            _buildAppBar(),
            8.verticalSpace,
            Expanded(
              child: Container(
                color: AssetColors.whiteFAFAFA,
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      _buildHeader(),
                      16.verticalSpace,
                      _buildContent(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: AssetColors.whiteFAFAFA,
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AssetColors.black44350D0p08,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Obx(
                  () => const Text('Update')
                      .elevatedButton(
                          onPressed:
                              controller.buttonActive.value ? () {} : null)
                      .paddingOnly(bottom: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Row(
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
          'Profile',
          style: Get.textTheme.headline5!.bold.textWhite,
        )
      ],
    ).paddingSymmetric(horizontal: 16);
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 215,
      decoration: BoxDecoration(
        color: AssetColors.primaryTwo,
        image: DecorationImage(
          image: AssetImage('img_header_profile'.assetPathPNG),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                width: 115,
                height: 115,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const ClipOval(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedImageNetworkWidget(
                      url:
                          'https://kenh14cdn.com/thumb_w/660/2017/75614297jw1faoy1g9cnlj21og23je84-1509002837953.jpg'),
                ),
              ),
              Image.asset(
                'ic_change_avatar_profile'.assetPathIconPNG,
                width: 40,
              ),
            ],
          ),
          12.verticalSpace,
          Text(
            'Nguyễn Hưng Thịnh',
            style: _textTheme.headline5!.textWhite,
          )
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        _buildContainerOne(),
        20.verticalSpace,
        _buildContainerTwo(),
        30.verticalSpace,
      ],
    ).paddingSymmetric(horizontal: 14);
  }

  Widget _buildContainerOne() {
    return Column(
      children: [
        ContainerProfileName(controller),
        12.verticalSpace,
        ContainerPhoneNumberUser(onChanged: controller.changePhoneNumber),
        12.verticalSpace,
        ContainerProfileEmail(controller),
      ],
    ).wrapCard;
  }

  Widget _buildContainerTwo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ContainerGender(
            initValue: controller.gender,
            onChanged: (val) {
              controller.gender == val;
              controller.validator();
            }),
        12.verticalSpace,
        TextFormFieldDateTime(
          title: 'Birthday',
          initDate: controller.birthDay,
          onChanged: (val) {
            controller.birthDay = val;
            controller.validator();
          },
        ),
      ],
    ).wrapCard;
  }
}
