import 'package:flutter/material.dart';

Widget bigCircle(
    {double width = 264,
    double height = 264,
    BuildContext context,
    Widget child = const SizedBox()}) {
  return Container(
      width: width,
      height: height,
      child: Align(alignment: Alignment.center, child: child),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: Color.fromRGBO(235, 235, 235, 1.0), width: width / 264))
      //borderRadius: BorderRadius.all(Radius.circular(40.0))),
      );
}
