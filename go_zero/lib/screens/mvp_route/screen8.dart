import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_zero/screens/mvp_route/ui/screensize.dart';
import 'package:go_zero/screens/mvp_route/ui/textstyle.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/circleCaption.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/pressAnywhereLabel.dart';

import 'ui/colors.dart';
import 'ui/widgets/circle.dart';
import 'ui/widgets/colorfulCircle.dart';
import 'ui/widgets/headline.dart';

class FootPrintResultScreen extends StatefulWidget {
  @override
  _FootPrintResultScreenState createState() => _FootPrintResultScreenState();
}

double _number = 13.3;
double _avgGermany = 8.6;
double _avgWorld = 4.8;

const double _YHEIGHTFACTORBIGCIRCLE = 0.389;
const String NEXTSCREEN = "/screen9";


class _FootPrintResultScreenState extends State<FootPrintResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, NEXTSCREEN);
            },
            child: Stack(
              children: <Widget>[
                Container(color: GoZeroColors.background),
                Headline("YOUR FOOTPRINT"),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: EdgeInsets.only(//TODO: Abstand nach links einfügen
                            top: _YHEIGHTFACTORBIGCIRCLE *
                                getScreenHeight(context)),
                        child: ColorfulCircle(_number,
                            unit: "t per year",
                            colors: [
                              GoZeroColors.green,
                              Colors.yellow,
                              Colors.red
                            ],
                            icons: [
                              FontAwesomeIcons.rocket,
                              Icons.home,
                              Icons.person_outline
                            ]))),
                SmallCircleWithCaption(_avgGermany, unit: "t/year", caption: "Average in Germany"),
                SmallCircleWithCaption(_avgWorld, unit: "t/year", caption: "Average in world"),
                pressAnywhere(context)
              ],
            )));
  }
}
