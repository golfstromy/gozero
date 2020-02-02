import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/pressAnywhereLabel.dart';

import 'ui/colors.dart';
import 'ui/images.dart';
import 'ui/widgets/circle.dart';
import 'ui/widgets/progressbar.dart';

const int index = 2;

class CalculateIntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/screen5"),
      child: Stack(
        children: <Widget>[
          Container(color: GoZeroColors.background),
          Align(
            alignment: Alignment.topLeft,
            child: progressbar(index, context),
          ),
          Container(
              child: Align(
            alignment: Alignment.center,
            child: bigCircle(child: Image.asset(CALCULATEFOOTPRINT)),
          )),
          pressAnywhere(context)
        ],
      ),
    ));
  }
}
