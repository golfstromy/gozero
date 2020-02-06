import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/pressAnywhereLabel.dart';

import 'ui/colors.dart';
import 'ui/screensize.dart';
import 'ui/widgets/circle.dart';
import 'ui/widgets/logo.dart';

const String NEXTSCREEN = "/screen2";

class InitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NEXTSCREEN);
        HapticFeedback.lightImpact(); //TODO: Testen
      },
      child: Stack(
        children: <Widget>[
          Container(color: GoZeroColors.background),
          Container(
              child: Align(
                  alignment: Alignment.center,
                  child: circleWithText(context,"Show our planet\nsome ", "love"))),
          Positioned(
            top: 0.2354 * getScreenHeight(context),
            right: 1.5 * SMALLGAP(context),
            child: LOGOTEXTWIDGET(),
          ),
          pressAnywhere(context)
        ],
      ),
    ));
  }
}
