import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/user_input/yesNoAnswer.dart';

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

const double _EUROPEFLIGHTSMIN = 0;
const double _EUROPEFLIGHTSMAX = 100;
const double _EUROPEFLIGHTSINIT = 50;

const double _INTERNATIONALFLIGHTMIN = 0;
const double _INTERNATIONALFLIGHTMAX = 200;
const double _INTERNATIONALFLIGHTINIT = 100;

double _dEurope = _EUROPEFLIGHTSINIT;
double _dInternational = _INTERNATIONALFLIGHTINIT;
TextEditingController _europeFlightController = TextEditingController();
TextEditingController _internationalFlightController = TextEditingController();

class _MobilityScreenState extends State<MobilityScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _europeFlightController.text = _EUROPEFLIGHTSINIT.round().toString();
      _internationalFlightController.text =
          _INTERNATIONALFLIGHTINIT.round().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    //TODO: REALIGN QUESTIONS TO FIT SCREEN COMPLETELY
    List<Widget> question1 = question(
      context,
      topPadding: 0.048 * getScreenHeight(context),
      subheadlineText: "Do you own a car?",
      subheadlineIcon: ICON,
      possibleAnswers: Padding(
          padding: EdgeInsets.only(top: 0.038 * getScreenHeight(context)),
          child: YesNoAnswer()),
    );

    var question2 = question(
      context,
      topPadding: 0.045 * getScreenHeight(context),
      subheadlineText: "Do you use public transportation?",
      subheadlineIcon: ICON,
      possibleAnswers: YesNoAnswer(
        padding: EdgeInsets.only(
            top: 22 / 667 * getScreenHeight(context),
            left: 45 / 375 * getScreenWidth(context)),
      ),
    );

    var question3 = question(context,
        topPadding: 0.045 * getScreenHeight(context),
        subheadlineText: "Flights in Europe in h per year",
        subheadlineIcon: FontAwesomeIcons.plane,
        possibleAnswers: SliderWithTextInput(
            padding: EdgeInsets.only(top: 25 / 667 * getScreenHeight(context)),
            controller: _europeFlightController,
            min: _EUROPEFLIGHTSMIN,
            max: _EUROPEFLIGHTSMAX,
            onChangedText: (newVal) {
              setState(() {
                _dEurope = int.parse(newVal) <= _EUROPEFLIGHTSMAX
                    ? int.parse(newVal).toDouble()
                    : _EUROPEFLIGHTSMAX;
              });
            },
            onChangedSlider: (value) {
              setState(() {
                _dEurope = value;
                _europeFlightController.text = value.round().toString();
              });
            },
            val: _dEurope));

    var question4 = question(context,
        topPadding: 0.04 * getScreenHeight(context),
        subheadlineText: "International flights in h per year",
        subheadlineIcon: FontAwesomeIcons.plane,
        possibleAnswers: SliderWithTextInput(
            padding: EdgeInsets.only(top: 25 / 667 * getScreenHeight(context)),
            controller: _internationalFlightController,
            min: _INTERNATIONALFLIGHTMIN,
            max: _INTERNATIONALFLIGHTMAX,
            onChangedText: (newVal) {
              setState(() {
                _dInternational = int.parse(newVal) <= _INTERNATIONALFLIGHTMAX
                    ? int.parse(newVal).toDouble()
                    : _INTERNATIONALFLIGHTMAX;
              });
            },
            onChangedSlider: (value) {
              setState(() {
                _dInternational = value;
                _internationalFlightController.text = value.round().toString();
              });
            },
            val: _dInternational));

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
                    question1[0], //QUESTION/APP OUTPUT
                    question1[1], //ANSWER/USER INPUT
                    question2[0],
                    question2[1],
                    question3[0],
                    question3[1],
                    question4[0],
                    question4[1]
                  ],
                ),
              ),
            )),
        continueButton(context, NEXTSCREEN)
      ],
    )));
  }
}
