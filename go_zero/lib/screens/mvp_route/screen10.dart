import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/screensize.dart';

import 'ui/widgets/cards/grouped/groupedSelectableCards.dart';
import 'ui/widgets/circle.dart';
import 'ui/widgets/headline.dart';
import 'ui/widgets/progressbar.dart';

const int INDEX = 8;
const String NEXTSCREEN = "/screen11";

const double _GAPBETWEENCARDSFACTOR = 16 / 667;

class CompensateScreen extends StatefulWidget {
  @override
  _CompensateScreenState createState() => _CompensateScreenState();
}

class _CompensateScreenState extends State<CompensateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      child: Stack(
        children: <Widget>[
          Headline("COMPENSATE"),
          Align(
            alignment: Alignment.topLeft,
            child: progressbar(INDEX, context),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  top: 94 / 667 * getScreenHeight(context),
                ),
                child: circleWithStackedText(
                    context, //TODO: FIX ALIGNMENT!!
                    "\nThe earth is a\nfine place and worth\n",
                    "fighting for",
                    punctuationMark: "!",
                    sizeFactor: 128 / getScreenWidth(context)),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: 0.035 * getScreenHeight(context),
                      left: 0.12 * getScreenWidth(context)),
                  child: SelectableWideCardGroup(
                    innerSpacing: EdgeInsets.only(
                        top: _GAPBETWEENCARDSFACTOR * getScreenHeight(context)),
                    texts: [
                      "One week",
                      "One month",
                      "Three months",
                      "One year"
                    ],
                    checked: ["One month"],
                  ))
            ]),
          ),
        ],
      ),
    )));
  }
}
