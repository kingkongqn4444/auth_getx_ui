import 'package:flutter/material.dart';
import 'package:base_flutter_app/common/common.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool initValue;
  final Function(bool)? callBack;
  final Color? borderColor;

  const CheckBoxWidget({Key? key, this.initValue = false, this.callBack, this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return InkWell(
      onTap: () {
        callBack?.call(!initValue);
      },
      focusColor: _theme.primaryColor,
      child: AnimatedContainer(
        width: 25,
        height: 25,
        padding: const EdgeInsets.all(6),
        duration: 150.milliseconds,
        alignment: Alignment.center,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: initValue ? _theme.primaryColor : Colors.white,
          border: Border.all(
            color: initValue ? Colors.transparent : (borderColor ?? _theme.dividerColor),
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Image.asset('ic_check'.assetPathIconPNG, color: Colors.white),
      ),
    );
  }
}
