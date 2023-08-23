import 'package:flutter/material.dart';

extension PaddingEx on Widget {
  /// Text("Nonstop").paddingAll(8),
  /// Text("IO").paddingAll(8),
  /// Text("Technologies Pvt Ltd").paddingAll(8),
  Widget paddingAll(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );

  Widget paddingSymmetric({double? horizontal, double? vertical}) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal ?? 0,
          vertical: vertical ?? 0,
        ),
        child: this,
      );

  Widget paddingH(double horizontal) => Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal),
        child: this,
      );

  Widget paddingV(double vertical) => Padding(
        padding: EdgeInsets.symmetric(vertical: vertical),
        child: this,
      );

  Widget paddingOnly({
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          left: left ?? 0,
          right: right ?? 0,
          top: top ?? 0,
          bottom: bottom ?? 0,
        ),
        child: this,
      );
}
