import 'package:flutter/material.dart';

class Dimens {
  Dimens._();

  static EdgeInsets all(double value) => EdgeInsets.all(value);

  static EdgeInsets symetric({required double h, required double v}) =>
      EdgeInsets.symmetric(horizontal: h, vertical: v);

  static EdgeInsets fromTBLR(
          {required double t,
          required double b,
          required double l,
          required double r}) =>
      EdgeInsets.fromLTRB(l, t, r, b);

  static EdgeInsets top(double value) => EdgeInsets.fromLTRB(0, value, 0, 0);

  static EdgeInsets bottom(double value) => EdgeInsets.fromLTRB(0, 0, 0, value);

  static EdgeInsets left(double value) => EdgeInsets.fromLTRB(value, 0, 0, 0);

  static EdgeInsets right(double value) => EdgeInsets.fromLTRB(0, 0, value, 0);

  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double scaleX(BuildContext context, scale) =>
      MediaQuery.of(context).size.width * scale;

  static double scaleY(BuildContext context, scale) =>
      MediaQuery.of(context).size.height * scale;

  static BorderRadius borderRadius(double radius) =>
      BorderRadius.all(Radius.circular(radius));
}
