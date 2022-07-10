import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  // Expand
  Widget get fullWidth => SizedBox(width: double.maxFinite, child: this);
  Widget get fulHeight => SizedBox(height: double.maxFinite, child: this);

  Widget wrapHeight(double amount) => SizedBox(height: amount, child: this);
  Widget wrapWidth(double amount) => SizedBox(width: amount, child: this);
  Widget wrapSize(double height, double width) => SizedBox(width: width, height: height, child: this);
}
