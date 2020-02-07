import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_zero/screens/mvp_route/ui/screensize.dart';
import 'package:go_zero/screens/mvp_route/ui/textstyle.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/cards/groupedSelectableCards.dart';

import 'ui/colors.dart';
import 'ui/images.dart';

import 'ui/widgets/cards/smallestCard.dart';
import 'ui/widgets/inputs.dart';
import 'ui/widgets/pressAnywhereLabel.dart';
import 'ui/widgets/progressbar.dart';

const String NEXTSCREEN = "/screen8"; //TODO: Fixen nach Entwurf von Screen6

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
const double _WEIGHTINITVALUE = 80;
const double _WEIGHTFONTSIZE = 14;

const double _WEIGHTTEXTMARGINFCT = 27 /
    375 /
    1.2; //MARGIN:SCREENWIDTH px in Mockup, durch 1,2 damit mehr Platz für dreistellige Zahlen ist

double _dWeight = _WEIGHTINITVALUE;
TextEditingController _weightController = TextEditingController();

class _MyPersonScreenState extends State<MyPersonScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _weightController.text = _WEIGHTINITVALUE.round().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    Padding(
                        padding: EdgeInsets.only(
                            top: 0.048 * getScreenHeight(context),
                            left: 0.064 * getScreenWidth(context),
                            right: 0.064 * getScreenWidth(context)),
                        child: subHeadline(context, Icons.person, "Gender")),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 0.035 * getScreenHeight(context),
                            left: 0.12 * getScreenWidth(context)),
                        child: SelectableWideCardGroup(
                            innerSpacing: EdgeInsets.only(
                                top: _GAPBETWEENCARDSFACTOR *
                                    getScreenHeight(context)),
                            texts: ["Female", "Male"],
                            images: [GoZeroIcons.female, GoZeroIcons.male])),
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
                        child:
                            subHeadline(context, Icons.person, "Weight in kg")),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 0.038 * getScreenHeight(context)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SmallestCard(
                            setHeight: false,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      left: _WEIGHTTEXTMARGINFCT *
                                          getScreenWidth(context),
                                      right: _WEIGHTTEXTMARGINFCT *
                                          getScreenWidth(context)),
                                  child: TextField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(3),
                                    ],
                                    style: GoZeroTextStyles.regular(
                                        _WEIGHTFONTSIZE,
                                        color: GoZeroColors.green),
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                    controller: _weightController,
                                    keyboardType: TextInputType.number,
                                    onChanged: (newVal) {
                                      setState(() {
                                        _dWeight = int.parse(newVal) <=
                                                _WEIGHTSLIDERMAX
                                            ? int.parse(newVal).toDouble()
                                            : _WEIGHTSLIDERMAX;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                            selectable: false,
                          ),
                          Slider(
                            min: _WEIGHTSLIDERMIN,
                            max: _WEIGHTSLIDERMAX,
                            onChanged: (value) {
                              setState(() {
                                _dWeight = value;
                                _weightController.text =
                                    value.round().toString();
                              });
                            },
                            value: _dWeight,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
        pressAnywhere(context),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: FlatButton(
                //TODO: Ästhethisch gestalten & positionieren
                child: Text("CONTINUE"),
                onPressed: () {
                  Navigator.pushNamed(context, NEXTSCREEN);
                },
              )),
        )
      ],
    )));
  }
}
