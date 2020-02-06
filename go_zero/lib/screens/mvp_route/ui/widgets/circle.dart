import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/screensize.dart';

import '../colors.dart';
import '../textstyle.dart';

const double DEFAULTWIDTHFACTOR =
    264 / 375; //Verhältnis im Mockup Kreis:Bildschirmbreite

//TODO: Images dadrin auch anpassen an Größe
Widget bigCircle(BuildContext context,
    {double sizeFactor = DEFAULTWIDTHFACTOR,
    Widget child = const SizedBox(),
    double thickness = 2}) {
  return Container(
      width: sizeFactor * getScreenWidth(context),
      height: sizeFactor * getScreenWidth(context),
      child: Align(alignment: Alignment.center, child: child),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
              Border.all(color: GoZeroColors.controlGrey, width: thickness)));
}

const double _LOGOTEXTSIZE = 24;
Widget circleWithText(BuildContext context, String blacktext, String greenText,
    {String punctuationMark = ".",
    double sizeFactor = DEFAULTWIDTHFACTOR,
    double thickness = 2}) {
  return bigCircle(context,
      sizeFactor: sizeFactor,
      thickness: thickness,
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoZeroTextStyles.bold(),
            children: <TextSpan>[
              TextSpan(text: blacktext),
              TextSpan(
                  text: greenText,
                  style: GoZeroTextStyles.semibold(_LOGOTEXTSIZE,
                      color: GoZeroColors.green)),
              TextSpan(text: punctuationMark),
            ],
          )));
}

const double _SMALLCIRCLEBIGFONTSIZE = 30;
const double _SMALLCIRCLESMALLFONTSIZE = 18;

class SmallCircle extends StatelessWidget {
  final double number;
  final String unit;

  const SmallCircle({@required this.number, this.unit});

  @override
  Widget build(BuildContext context) {
    return bigCircle(context,
        sizeFactor: 0.296,
        child: Center(
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoZeroTextStyles.semibold(
                    _SMALLCIRCLEBIGFONTSIZE), //TODO: Ersetzen
                children: <TextSpan>[
                  TextSpan(text: number.toString()),
                  TextSpan(
                      text: " " + unit,
                      style:
                          GoZeroTextStyles.semibold(_SMALLCIRCLESMALLFONTSIZE)),
                ],
              )),
        ));
  }
}
