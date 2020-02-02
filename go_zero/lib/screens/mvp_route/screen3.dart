import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/colors.dart';
import 'package:go_zero/screens/mvp_route/ui/screensize.dart';
import 'package:go_zero/screens/mvp_route/ui/textstyle.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/circle.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/logoAsText.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/ordered_bulletpoint.dart';

import 'ui/widgets/pressAnywhereLabel.dart';
import 'ui/widgets/progressbar.dart';

const double HEADLINEFONTSIZE = 18;
const int index = 1;

class HowItWorksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/screen4");
            },
            child: Stack(
              children: <Widget>[
                Container(
                  color: GoZeroColors.background,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: progressbar(index, context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0.129 * getScreenHeight(context)),
                          child: circleWithText("The time to act\nis ", "now"),
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 0.0555 * getScreenHeight(context),
                            right: 0.036 * getScreenWidth(context)),
                        child: RichText(
                            text: TextSpan(
                                style:
                                    GoZeroTextStyles.medium(HEADLINEFONTSIZE),
                                children: <TextSpan>[
                              TextSpan(text: "This is how "),
                              logoAsText(HEADLINEFONTSIZE),
                              TextSpan(text: " works")
                            ]))),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 0.021 * getScreenHeight(context)),
                          child: getStepsAsCol(context, [ 
                            "Get aware of your personal impact on \nclimate change by determining your \nCO2 carbon footprint",
                            "Compensate your CO2 emissions on a\nweekly, monthly or yearly basis*",
                            "*We are currently working on even better solutions, but this is an awesome thing to start with!",
                            "Share your environmental impact to your\nfamily members & friends ",
                          ], fineprintIndex: [
                            2
                          ]),
                        ))
                  ],
                ),
                pressAnywhere(context)
              ],
            )));
  }
}
