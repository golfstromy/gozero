import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/pressAnywhereLabel.dart';

import 'ui/colors.dart';
import 'ui/images.dart';
import 'ui/screensize.dart';
import 'ui/textstyle.dart';
import 'ui/widgets/circle.dart';

class InitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/screen2"),
      child: Stack(
        children: <Widget>[
          Container(color: GoZeroColors.background),
          Container(
              child: Align(
            alignment: Alignment.center,
            child: circleWithText("Show our planet\nsome ", "love")
          )),
          Positioned(
            top: 0.2354 * getScreenHeight(context),
            right: 1.5 * SMALLGAP(context),
            child: LOGOWIDGET(1.2),
          ),
          pressAnywhere(context)
        ],
      ),
    ));
  }
}
