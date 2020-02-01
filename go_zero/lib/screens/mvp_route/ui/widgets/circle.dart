import 'package:flutter/material.dart';

const double DEFAULTWIDTH = 264;

Widget bigCircle(
    {double width = DEFAULTWIDTH,
    double height = DEFAULTWIDTH,
    BuildContext context,
    Widget child = const SizedBox(),
    double thickness = DEFAULTWIDTH / 132}) {
  return Container(
      width: width,
      height: height,
      child: Align(alignment: Alignment.center, child: child),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Color.fromRGBO(235, 235, 235, 1.0), width: thickness))
      //borderRadius: BorderRadius.all(Radius.circular(40.0))),
      );
}
