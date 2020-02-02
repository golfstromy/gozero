import 'package:flutter/material.dart';
import 'package:go_zero/backend/screenInfo.dart';
import 'package:go_zero/screens/mvp_route/ui/colors.dart';
import 'package:go_zero/screens/mvp_route/ui/screensize.dart';

Widget progressbar(int index, BuildContext context) {
  double abstand = 0.0045 * getScreenHeight(context);
  double standardBreite = 2 * abstand;

  List<Widget> indicators = [];
  for (int i = 0; i < steps; i++) {
    indicators.add(Padding(
        padding: EdgeInsets.only(top: i == 0 ? 0 : abstand),
        child: Container(
            height: (getScreenHeight(context) / steps) - abstand,
            width: i <= index ? 1.5 * standardBreite : standardBreite,
            color: i <= index ? GoZeroColors.green : GoZeroColors.grey)));
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.end,
    children: indicators,
  );
}
