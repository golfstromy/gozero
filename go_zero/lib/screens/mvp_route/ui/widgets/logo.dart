import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/logoAsText.dart';

import '../images.dart';

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


const double _LOGOFONTSIZE = 16;
Widget LOGOTEXTWIDGET([double multiplier = 1]) {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(bottom: 6),
        child: Image.asset(TOPARROW,
            width: multiplier * 20.75, height: multiplier * 4.75),
      ),
      logoAsRichText(_LOGOFONTSIZE),
      Padding(
        padding: EdgeInsets.only(top: 6),
        child: Image.asset(BOTTOMARROW,
            width: multiplier * 20.75, height: multiplier * 4.75),
      ),
    ],
  );
}
