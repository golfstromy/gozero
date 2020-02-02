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
            child: bigCircle(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Show our planet", style: GoZeroTextStyles.semibold()),
                    RichText(
                        text: TextSpan(
                      style: GoZeroTextStyles.bold(),
                      children: <TextSpan>[
                        TextSpan(text: "some "),
                        TextSpan(
                            text: "love",
                            style: GoZeroTextStyles.semibold(
                                color: GoZeroColors.green)),
                        TextSpan(text: "."),
                      ],
                    ))
                  ]),
            ),
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
