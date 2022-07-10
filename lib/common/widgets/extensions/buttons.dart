import 'package:flutter/material.dart';

extension ElevatedButtonFromTextExtension on Widget {
  ElevatedButton elevatedButton({required VoidCallback? onPressed}) {
    return ElevatedButton(onPressed: onPressed, child: this);
  }

  OutlinedButton outlinedButton({required VoidCallback? onPressed}) {
    return OutlinedButton(onPressed: onPressed, child: this);
  }
}
