import 'package:base_flutter_app/biz/biz.dart';
import 'package:base_flutter_app/common/common.dart';
import 'package:flutter/material.dart';

class ButtonStateWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final ButtonStateEnum state;

  const ButtonStateWidget(
      {Key? key, this.onPressed, this.state = ButtonStateEnum.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _switchWidgetState()
        .elevatedButton(
            onPressed: state == ButtonStateEnum.hide
                ? null
                : () {
                    if (state != ButtonStateEnum.loading) {
                      onPressed?.call();
                    }
                  })
        .wrapHeight(56);
  }

  Widget _switchWidgetState() {
    switch (state) {
      case ButtonStateEnum.active:
        return Image.asset(
          'ic_arrow_right'.assetPathIconPNG,
          width: 22,
        );
      case ButtonStateEnum.loading:
        return const CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2,
        ).wrapSize(25, 25);
      default:
        return Image.asset(
          'ic_arrow_right'.assetPathIconPNG,
          width: 22,
        );
    }
  }
}
