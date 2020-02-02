import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/screensize.dart';
import 'package:go_zero/screens/mvp_route/ui/textstyle.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/pressAnywhereLabel.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/progressbar.dart';

import 'ui/colors.dart';
import 'ui/widgets/globe_bulletpoint.dart';

const double GAPMULTIPLIER = 2.3;
const int index = 0;

class ChallengeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/screen3"),
      child: Stack(children: <Widget>[
        Container(
          color: GoZeroColors.background,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: progressbar(index, context),
        ),
        Column(
          children: <Widget>[
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: GAPMULTIPLIER * 0.1154 * getScreenWidth(context)),
                  child: Text(
                    "Climate change is the \nbiggest challenge humanity \nhas ever faced.",
                    style: GoZeroTextStyles.semibold(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                )),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: //GAPMULTIPLIER *
                          0.1 * getScreenHeight(context)),
                  child: Column(
                    children: <Widget>[
                      bulletPoint(
                        context,
                        [
                          TextSpan(
                              text: "Flooding",
                              style: GoZeroTextStyles.semibold(fontSize: 14)),
                          TextSpan(
                              text:
                                  " of coastal areas due to a sea level \nrise of 50 cm")
                        ],
                      ),
                      bulletPoint(
                        context,
                        [
                          TextSpan(
                              text: "Armed conflicts",
                              style: GoZeroTextStyles.semibold(fontSize: 14)),
                          TextSpan(
                              text:
                                  " are likely to be about 40% \nmore probable")
                        ],
                      ),
                      bulletPoint(
                        context,
                        [
                          TextSpan(text: "Irreversible"),
                          TextSpan(
                              text: " melting of ice",
                              style: GoZeroTextStyles.semibold(fontSize: 14)),
                        ],
                      ),
                      bulletPoint(
                        context,
                        [
                          TextSpan(text: "20% to 40% of the"),
                          TextSpan(
                              text: " Amazonas",
                              style: GoZeroTextStyles.semibold(fontSize: 14)),
                          TextSpan(text: " will be \n"),
                          TextSpan(
                              text: "destroyed",
                              style: GoZeroTextStyles.semibold(fontSize: 14))
                        ],
                      ),
                      bulletPoint(
                        context,
                        [
                          TextSpan(text: "Water shortages periods of"),
                          TextSpan(
                              text: " drought",
                              style: GoZeroTextStyles.semibold(fontSize: 14)),
                          TextSpan(text: " and \ncrop failures"),
                        ],
                      ),
                      bulletPoint(
                        context,
                        [
                          TextSpan(
                              text:
                                  "Irreversible damage to 99% of corals due to \n"),
                          TextSpan(
                              text: " warming of the oceans",
                              style: GoZeroTextStyles.semibold(fontSize: 14)),
                        ],
                      ),
                      bulletPoint(
                        context,
                        [
                          TextSpan(text: "Half of all"),
                          TextSpan(
                              text: " animal",
                              style: GoZeroTextStyles.semibold(fontSize: 14)),
                          TextSpan(text: " & 60% of all "),
                          TextSpan(
                              text: "plant",
                              style: GoZeroTextStyles.semibold(fontSize: 14)),
                          TextSpan(text: " species\nwill be threatened with "),
                          TextSpan(
                              text: "extinction",
                              style: GoZeroTextStyles.semibold(fontSize: 14)),
                        ],
                      ),
                      bulletPoint(
                        context,
                        [
                          TextSpan(text: "Global"),
                          TextSpan(
                              text: " economic downturn",
                              style: GoZeroTextStyles.semibold(fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
        pressAnywhere(context, GoZeroColors.green)
      ]),
    ));
  }
}

const List<String> info = [
  "Flooding of coastal areas due to a sea level \nrise of 50 cm",
  "Armed conflicts are likely to be about 40% \nmore probable",
  "Irreversible melting of ice",
  "20% to 40% of the Amazonas will be \ndestroyed",
  "Water shortages periods of drought and \ncrop failures",
  "Irreversible damage to 99% of corals due to \nwarming of the oceans",
  "Half of all animal & 60% of all plant species\nwill be threatened with extinction\n"
      "Global economic downturn"
];
