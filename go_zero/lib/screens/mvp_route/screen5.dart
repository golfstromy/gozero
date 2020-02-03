import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/screensize.dart';
import 'package:go_zero/screens/mvp_route/ui/textstyle.dart';

import 'ui/colors.dart';
import 'ui/images.dart';
import 'ui/widgets/inputs.dart';
import 'ui/widgets/pressAnywhereLabel.dart';
import 'ui/widgets/progressbar.dart';

class MyPersonScreen extends StatefulWidget {
  @override
  _MyPersonScreenState createState() => _MyPersonScreenState();
}

const String _TITLE = "My Person";
const int INDEX = 3;
const double _TITLEFONTSIZE = 24;
const double _GAPBETWEENCARDSFACTOR = 16 / 667;

const double _WEIGHTSLIDERMIN = 1;
const double _WEIGHTSLIDERMAX = 200;

int weight = _WEIGHTSLIDERMIN as int;
double _dWeight = _WEIGHTSLIDERMIN;

class _MyPersonScreenState extends State<MyPersonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
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
                              style:
                                  GoZeroTextStyles.semibold(_TITLEFONTSIZE))),
                      Padding(
                          padding: EdgeInsets.only(
                              top: 0.048 * getScreenHeight(context),
                              left: 0.064 * getScreenWidth(context),
                              right: 0.064 * getScreenWidth(context)),
                          child: subHeadline(context, Icons.person, "Gender")),
                      Padding(
                          padding: EdgeInsets.only(
                              top: 0.035 * getScreenHeight(context)),
                          child: wideSelectionCard(
                              context, "Female", GoZeroIcons.female)),
                      Padding(
                          padding: EdgeInsets.only(
                              top: _GAPBETWEENCARDSFACTOR *
                                  getScreenHeight(context)),
                          child: wideSelectionCard(
                              context, "Male", GoZeroIcons.male)),
                      Padding(
                          padding: EdgeInsets.only(
                              top: 0.045 * getScreenHeight(context),
                              left: 0.064 * getScreenWidth(context),
                              right: 0.064 * getScreenWidth(context)),
                          child: subHeadline(context, Icons.person, "Age")),
                          //TODO: INSERT AGE 
                      Padding(
                          padding: EdgeInsets.only(
                              top: 0.045 * getScreenHeight(context),
                              left: 0.064 * getScreenWidth(context),
                              right: 0.064 * getScreenWidth(context)),
                          child: subHeadline(
                              context, Icons.person, "Weight in kg")),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 0.038 * getScreenHeight(context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            smallSelectionCard(context, weight.toString()),
                            Slider(
                              min: _WEIGHTSLIDERMIN,
                              max: _WEIGHTSLIDERMAX,
                              onChanged: (value) {
                                setState(() {
                                  _dWeight = value;
                                  weight = value.round();
                                });
                              },
                              value: _dWeight,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))),
        pressAnywhere(context)
      ],
    ));
  }
}
