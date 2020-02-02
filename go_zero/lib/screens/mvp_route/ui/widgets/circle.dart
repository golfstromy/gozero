import 'package:flutter/material.dart';

import '../colors.dart';
import '../textstyle.dart';

const double DEFAULTWIDTH = 264;

//TODO: Width von Screengröße abhängig machen, ebenso images darin etc.
Widget bigCircle(
    {double size = DEFAULTWIDTH,
    Widget child = const SizedBox(),
    double thickness = DEFAULTWIDTH / 132}) {
  return Container(
      width: size,
      height: size,
      child: Align(alignment: Alignment.center, child: child),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
              Border.all(color: GoZeroColors.circleGrey, width: thickness)));
}

const double _LOGOTEXTSIZE = 24;
Widget circleWithText(String blacktext, String greenText,
    {bool blackFullStop = true,
    double size = DEFAULTWIDTH,
    double thickness = DEFAULTWIDTH / 132}) {
  return bigCircle(
      size: size,
      thickness: thickness,
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoZeroTextStyles.bold(),
            children: <TextSpan>[
              TextSpan(text: blacktext),
              TextSpan(
                  text: greenText,
                  style: GoZeroTextStyles.semibold( _LOGOTEXTSIZE, color: GoZeroColors.green)),
              TextSpan(text: blackFullStop ? "." : ""),
            ],
          )));
}
