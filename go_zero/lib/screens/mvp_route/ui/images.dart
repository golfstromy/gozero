import 'package:flutter/material.dart';

const String LOGOWITHOUTARROWS = "assets/logo/logoWA4x.png";
const String TOPARROW = "assets/arrows/topArrow.png";
const String BOTTOMARROW = "assets/arrows/bottomArrowSmall.png";

const String GLOBEICON = "assets/icons/globe4x.png";

abstract class GoZeroIcons {
  static final Widget globe =  Image.asset(GLOBEICON, width: 16, height: 16);
}

Widget LOGOWIDGET([double multiplier = 1]) {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(bottom: 6),
        child: Image.asset(TOPARROW,
            width: multiplier * 20.75, height: multiplier * 4.75),
      ),
      Image.asset(LOGOWITHOUTARROWS,
          width: multiplier * 75.75, height: multiplier * 12),
      Padding(
        padding: EdgeInsets.only(top: 6),
        child: Image.asset(BOTTOMARROW,
            width: multiplier * 20.75, height: multiplier * 4.75),
      ),
    ],
  );
}
