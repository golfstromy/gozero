import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_zero/screens/mvp_route/ui/screensize.dart';
import 'package:go_zero/screens/mvp_route/ui/textstyle.dart';

import 'ui/colors.dart';
import 'ui/images.dart';

import 'ui/widgets/cards/grouped/groupedSelectableCards.dart';
import 'ui/widgets/cards/grouped/groupedSmallGridCard.dart';
import 'ui/widgets/cards/smallestCard.dart';
import 'ui/widgets/inputs.dart';
import 'ui/widgets/progressbar.dart';

const String NEXTSCREEN = "/screen8"; //TODO: Fixen nach Entwurf von Screen6

class LivingScreen extends StatefulWidget {
  @override
  _LivingScreenState createState() => _LivingScreenState();
}

const String _TITLE = "Living";

const int INDEX = 4;

const double _TITLEFONTSIZE = 24;
const double _GAPBETWEENCARDSFACTOR = 16 / 667;
const double _SLIDERFONTSIZE = 14;
const double _SLIDERTEXTMARGINFCT = 27 / 375; //MARGIN:SCREENWIDTH px in Mockup

const double _PEOPLEHOUSEHOLDMIN = 1;
const double _PEOPLEHOUSEHOLDMAX = 20;
const double _PEOPLEHOUSEHOLDINIT = 3;

const double _LIVINGSPACEMIN = 7;
const double _LIVINGSPACEMAX = 1000;
const double _LIVINGSPACEINIT = 70;

double _dHousehold = _PEOPLEHOUSEHOLDINIT;
double _dLivingSpace = _LIVINGSPACEINIT;
TextEditingController _householdController = TextEditingController();
TextEditingController _livingSpaceController = TextEditingController();

class _LivingScreenState extends State<LivingScreen> {
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
      subheadlineText: "Number of people you are living with",
      subheadlineIcon: Icons.home, //TODO: Icons ersetzen?
      possibleAnswers: Padding(
          padding: EdgeInsets.only(top: 0.038 * getScreenHeight(context)),
          child: slider(context,
              controller: _householdController,
              min: _PEOPLEHOUSEHOLDMIN,
              max: _PEOPLEHOUSEHOLDMAX, onChangedText: (newVal) {
            setState(() {
              _dHousehold = int.parse(newVal) <= _PEOPLEHOUSEHOLDMAX
                  ? int.parse(newVal).toDouble()
                  : _PEOPLEHOUSEHOLDMAX;
            });
          }, onChangedSlider: (value) {
            setState(() {
              _dHousehold = value;
              _householdController.text = value.round().toString();
            });
          }, val: _dHousehold)),
    );

    var question2 = question(
      context,
      topPadding: 0.045 * getScreenHeight(context),
      subheadlineText: "Living space in m²",
      subheadlineIcon: Icons.home,
      possibleAnswers: Padding(
          padding: EdgeInsets.only(top: 0.038 * getScreenHeight(context)),
          child: slider(context,
              controller: _livingSpaceController,
              min: _LIVINGSPACEMIN,
              max: _LIVINGSPACEMAX, onChangedText: (newVal) {
            setState(() {
              _dLivingSpace = int.parse(newVal) <= _LIVINGSPACEMIN
                  ? int.parse(newVal).toDouble()
                  : _LIVINGSPACEMAX;
            });
          }, onChangedSlider: (value) {
            setState(() {
              _dLivingSpace = value;
              _livingSpaceController.text = value.round().toString();
            });
          }, val: _dLivingSpace)),
    );

    var question3 = question(
      context,
      topPadding: 0.045 * getScreenHeight(context),
      subheadlineText: "Living space in m²",
      subheadlineIcon: Icons.home,
      possibleAnswers: SelectableSmallCardGrid( //TODO: Text richtig in eine Zeile
        crossAxisCount: 3,
        cardWidthFactor: 89/375,
        padding: EdgeInsets.only(
            top: 0.035 * getScreenHeight(context),
            left: 0.12 * getScreenWidth(context)),
        innerSpacing: EdgeInsets.only(
            top: _GAPBETWEENCARDSFACTOR * getScreenHeight(context), right: 12/375*getScreenWidth(context)),
        texts: ["- 1978", "1979 - 1983", "1984 - 1994", "1995 - 2001", "2001+", "- 1919*", "1920 - 1948*", "1949 - 2001*", "unknown"],
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
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
              padding:
                  EdgeInsets.only(top: (620 / 667) * getScreenHeight(context)),
              child: RaisedButton(
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

List<Widget> question(BuildContext context,
    {double topPadding = 0,
    @required String subheadlineText,
    @required IconData subheadlineIcon,
    @required Widget possibleAnswers}) {
  List<Widget> items = [];
  items.add(
    Padding(
        padding: EdgeInsets.only(
            top: topPadding,
            left: 0.064 * getScreenWidth(context),
            right: 0.064 * getScreenWidth(context)),
        child: subHeadline(context, subheadlineIcon, subheadlineText)),
  );
  items.add(possibleAnswers);
  return items;
}

Widget slider(BuildContext context,
    {@required TextEditingController controller,
    @required double min,
    @required double max,
    @required ValueChanged onChangedText,
    @required ValueChanged onChangedSlider,
    @required Object val}) {
  return Row(
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
                  //TODO: Optimierung Anzeige
                  left: _SLIDERTEXTMARGINFCT * getScreenWidth(context),
                  right: _SLIDERTEXTMARGINFCT * getScreenWidth(context)),
              child: TextField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(3),
                  ],
                  style: GoZeroTextStyles.regular(_SLIDERFONTSIZE,
                      color: GoZeroColors.green),
                  decoration: InputDecoration(border: InputBorder.none),
                  controller: controller,
                  keyboardType: TextInputType.number,
                  onChanged: onChangedText),
            )
          ],
        ),
        selectable: false,
      ),
      Slider(
        //TODO: Nur ganzzahlig Option

        min: min,
        max: max,
        onChanged: onChangedSlider,
        value: val,
      )
    ],
  );
}
