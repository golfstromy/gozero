import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_zero/screens/mvp_route/ui/screensize.dart';
import 'package:go_zero/screens/mvp_route/ui/textstyle.dart';

import 'ui/colors.dart';
import 'ui/widgets/cards/grouped/groupedSelectableCards.dart';
import 'ui/widgets/circle.dart';
import 'ui/widgets/headline.dart';
import 'ui/widgets/progressbar.dart';
import 'ui/widgets/user_input/question.dart';

const int INDEX = 8;
const String NEXTSCREEN = "/screen11";

const double _GAPBETWEENCARDSFACTOR = 16 / 667;
const double _INFOFONTSIZE = 14;

//const List<String> _INFOTEXT =[
  //  "Our partner \"cloverly\" takes care of your \ndonation. All ", "donations are in best hands", ". \nCloverly focuses on supporting renewable \nenergy and use a software to find the closest \noffset around you. Of every donatation they only \ncharge 0,25€."];
const String _INFOTEXT = "Our partner \"cloverly\" takes care of your \ndonation. All donations are in best hands. \nCloverly focuses on supporting renewable \nenergy and use a software to find the closest \noffset around you. Of every donatation they only \ncharge 0,25€.";

class CompensateScreen extends StatefulWidget {
  @override
  _CompensateScreenState createState() => _CompensateScreenState();
}

class _CompensateScreenState extends State<CompensateScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> q1 = question(context,
        iconColor: GoZeroColors.green,
        topPadding: 0.024 * getScreenHeight(context),
        subheadlineText:
            "For how long would you like to offset your \ncarbon emissions?",
        subheadlineIcon: FontAwesomeIcons.lifeRing,
        possibleAnswers: Padding(
            padding: EdgeInsets.only(
                top: 0.035 * getScreenHeight(context),
                left: 0.12 * getScreenWidth(context)),
            child: SelectableWideCardGroup(
              innerSpacing: EdgeInsets.only(
                  top: _GAPBETWEENCARDSFACTOR * getScreenHeight(context)),
              texts: ["One week", "One month", "Three months", "One year"],
              onSelected: (selection) {
                String unit = "t per week";
                if (selection[0] == "One month")
                  unit = "t per month";
                else if (selection[0] == "Three months")
                  unit = "t per quarter";
                else if (selection[0] == "One year") unit = "t per year";
                Navigator.pushNamed(context, NEXTSCREEN,
                    arguments: unit); //TODO: Push with selection
              },
              checked: ["One month"],
            )));

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
                    top: 14 / 667 * getScreenHeight(context),
                    left: 24 / 375 * getScreenWidth(context)),
                child: Text(
                  _INFOTEXT,
                  style: GoZeroTextStyles.regular(_INFOFONTSIZE),
                ),
              ),
              q1[0],
              q1[1],
            ]),
          ),
        ],
      ),
    )));
  }
}
