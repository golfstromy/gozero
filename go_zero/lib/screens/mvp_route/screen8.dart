import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_zero/screens/mvp_route/ui/textstyle.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/pressAnywhereLabel.dart';

import 'ui/colors.dart';
import 'ui/widgets/circle.dart';
import 'ui/widgets/headline.dart';

class FootPrintResultScreen extends StatefulWidget {
  @override
  _FootPrintResultScreenState createState() => _FootPrintResultScreenState();
}

double _number = 13.3;
double _avgGermany = 8.6;
double _avgWorld = 4.8;

const String NEXTSCREEN = "/screen9";
const double _SMALLTEXTFONTSIZE = 16;

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
                colorfulCircle(_number, unit: "t per year", colors: [
                  GoZeroColors.green,
                  Colors.yellow,
                  Colors.red
                ], icons: [
                  FontAwesomeIcons.rocket,
                  Icons.home,
                  Icons.person_outline
                ]),
                Column(
                  children: <Widget>[
                    SmallCircle(number: _avgGermany, unit: "t/year"),
                    Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text("Average in Germany",
                            style:
                                GoZeroTextStyles.regular(_SMALLTEXTFONTSIZE)))
                  ],
                ),
                Column(
                  children: <Widget>[
                    SmallCircle(number: _avgWorld, unit: "t/year"),
                    Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text(
                          "Average in Germany",
                          style: GoZeroTextStyles.regular(_SMALLTEXTFONTSIZE),
                        ))
                  ],
                ),
                pressAnywhere(context)
              ],
            )));
  }
}

Widget colorfulCircle(double number,
    {unit = "",
    List<Color> colors = const [GoZeroColors.green],
    List<IconData> icons: const []}) {
  //TODO: ColorfulCircle
  return Text("Lorem ipsum");
}
