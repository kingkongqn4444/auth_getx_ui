import 'package:base_flutter_app/theme/theme.dart';
import 'package:flutter/material.dart';

import '../common.dart';

class StepWidget extends StatefulWidget {
  final String title;
  final int step;
  final int total;
  final bool isStrikethrough;


  const StepWidget({Key? key, required this.title,required this.step,required this.total,this.isStrikethrough=false}) : super(key: key);

  @override
  State<StepWidget> createState() => _StepWidgetState();
}

class _StepWidgetState extends State<StepWidget> {
  final _textTheme = Get.textTheme;

  final _containerKey = GlobalKey();

  final _widthContainer = 0.0.obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final _width = _containerKey.currentContext?.size?.width ?? 0;
      _widthContainer.value = _width - (_width / widget.total) * widget.step;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            _buildStep(),
            16.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: _textTheme.subtitle1,
                  ),
                  12.verticalSpace,
                  Container(
                    key: _containerKey,
                    alignment: Alignment.topLeft,
                    width: double.infinity,
                    height: 4,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AssetColors.black44350D0p08,
                    ),
                    child: Obx(() {
                      return Container(
                        margin: EdgeInsets.only(right: _widthContainer.value),
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AssetColors.primaryTwo,
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ],
        ),
        16.verticalSpace,
        if(widget.isStrikethrough) Container(width: 35, height: 2, color: AssetColors.yellowD3A429).paddingOnly(bottom: 16),
      ],
    );
  }

  Widget _buildStep() {
    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(shape: BoxShape.circle, color: AssetColors.yellowD3A4290p16),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(text: '${widget.step}', style: _textTheme.subtitle1!.textPrimary, children: [
          TextSpan(
            text: '/${widget.total}',
            style: _textTheme.overline!.textBlack44350D0p6,
          ),
        ]),
      ),
    );
  }
}
