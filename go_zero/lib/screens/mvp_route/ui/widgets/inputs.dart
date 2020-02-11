import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/textstyle.dart';

import '../colors.dart';
import '../screensize.dart';


const double _SUBHEADLINEFONTSIZE = 14;
const double _ICONSIZE = 16;

Widget subHeadline(BuildContext context, IconData icon, String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        children: <Widget>[
          Icon(
            icon,
            size: _ICONSIZE,
            color: GoZeroColors.yellow,
          ),
          Padding(
              padding: EdgeInsets.only(left: 0.032 * getScreenWidth(context)),
              child: Text(title,
                  style: GoZeroTextStyles.regular(_SUBHEADLINEFONTSIZE)))
        ],
      ),
      Padding(
          padding: EdgeInsets.only(top: 0.0075 * getScreenHeight(context)),
          child: Container(
              width: 0.872 * getScreenWidth(context),
              height: 0.0014 * getScreenHeight(context),
              color: GoZeroColors.controlGrey))
    ],
  );
}
