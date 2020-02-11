import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../backend/screenInfo.dart';

import 'ui/colors.dart';
import 'ui/screensize.dart';
import 'ui/textstyle.dart';

import 'ui/widgets/cards/grouped/groupedSmallGridCard.dart';
import 'ui/widgets/continueButton.dart';
import 'ui/widgets/progressbar.dart';
import 'ui/widgets/user_input/question.dart';
import 'ui/widgets/user_input/sliderWithTextInput.dart';

const String NEXTSCREEN = "/screen8";
const IconData ICON = FontAwesomeIcons.car; //TODO: Icons ersetzen?
const String _TITLE = "Mobility";
const int INDEX = 5;

class MobilityScreen extends StatefulWidget {
  @override
  _MobilityScreenState createState() => _MobilityScreenState();
}

const double _TITLEFONTSIZE = QuestionScreen.TITLEFONTSIZE;
const double _GAPBETWEENCARDSFACTOR = QuestionScreen.GAPBETWEENCARDS;
//MARGIN:SCREENWIDTH px in Mockup

const double _PEOPLEHOUSEHOLDMIN = 1;
const double _PEOPLEHOUSEHOLDMAX = 20;
const double _PEOPLEHOUSEHOLDINIT = 3;

const double _LIVINGSPACEMIN = 7;
const double _LIVINGSPACEMAX = 999;
const double _LIVINGSPACEINIT = 70;

double _dHousehold = _PEOPLEHOUSEHOLDINIT;
double _dLivingSpace = _LIVINGSPACEINIT;
TextEditingController _householdController = TextEditingController();
TextEditingController _livingSpaceController = TextEditingController();

class _MobilityScreenState extends State<MobilityScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _householdController.text = _PEOPLEHOUSEHOLDINIT.round().toString();
      _livingSpaceController.text = _LIVINGSPACEINIT.round().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> question1 = question(
      context,
      topPadding: 0.048 * getScreenHeight(context),
      subheadlineText: "Do you own a car?",
      subheadlineIcon: ICON,
      possibleAnswers: Padding(
          padding: EdgeInsets.only(top: 0.038 * getScreenHeight(context)),
          child: SliderWithTextInput(
              controller: _householdController,
              min: _PEOPLEHOUSEHOLDMIN,
              max: _PEOPLEHOUSEHOLDMAX,
              onChangedText: (newVal) {
                setState(() {
                  _dHousehold = int.parse(newVal) <= _PEOPLEHOUSEHOLDMAX
                      ? int.parse(newVal).toDouble()
                      : _PEOPLEHOUSEHOLDMAX;
                });
              },
              onChangedSlider: (value) {
                setState(() {
                  _dHousehold = value;
                  _householdController.text = value.round().toString();
                });
              },
              val: _dHousehold)),
    );

    var question2 = question(
      context,
      topPadding: 0.045 * getScreenHeight(context),
      subheadlineText: "Living space in m²",
      subheadlineIcon: ICON,
      possibleAnswers: Padding(
          padding: EdgeInsets.only(top: 0.038 * getScreenHeight(context)),
          child: SliderWithTextInput(
              controller: _livingSpaceController,
              min: _LIVINGSPACEMIN,
              max: _LIVINGSPACEMAX,
              onChangedText: (newVal) {
                setState(() {
                  _dLivingSpace = int.parse(newVal) <= _LIVINGSPACEMAX
                      ? int.parse(newVal).toDouble()
                      : _LIVINGSPACEMAX;
                });
              },
              onChangedSlider: (value) {
                setState(() {
                  _dLivingSpace = value;
                  _livingSpaceController.text = value.round().toString();
                });
              },
              val: _dLivingSpace)),
    );

    var question3 = question(
      context,
      topPadding: 0.045 * getScreenHeight(context),
      subheadlineText: "Year of construction/standard of the house",
      subheadlineIcon: ICON,
      possibleAnswers: SelectableSmallCardGrid(
        //TODO: Text richtig in eine Zeile
        crossAxisCount: 3,
        cardWidthFactor: 89 / 375,
        padding: EdgeInsets.only(
            top: 0.035 * getScreenHeight(context),
            left: 0.12 * getScreenWidth(context)),
        innerSpacing: EdgeInsets.only(
            top: _GAPBETWEENCARDSFACTOR * getScreenHeight(context),
            right: 12 / 375 * getScreenWidth(context)),
        texts: [
          "- 1978",
          "1979 - 1983",
          "1984 - 1994",
          "1995 - 2001",
          "2001+",
          "- 1919*",
          "1920 - 1948*",
          "1949 - 2001*",
          "unknown"
        ],
        checked: ["- 1978"],
        //TODO: Sternchen Erklärung
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(
      children: <Widget>[
        Container(color: GoZeroColors.background),
        Align(
          alignment: Alignment.topLeft,
          child: progressbar(INDEX, context),
        ),
        Container(
            width: getScreenWidth(context),
            child: Align(
              alignment: Alignment.topLeft,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(
                            top: 0.087 * getScreenHeight(context)),
                        child: Text(_TITLE,
                            style: GoZeroTextStyles.semibold(_TITLEFONTSIZE))),
                    question1[0],
                    question1[1],
                    question2[0],
                    question2[1],
                    question3[0],
                    question3[1]
                  ],
                ),
              ),
            )),
        continueButton(context, NEXTSCREEN)
      ],
    )));
  }
}
