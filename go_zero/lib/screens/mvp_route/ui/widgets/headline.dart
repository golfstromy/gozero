import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/screensize.dart';
import 'package:go_zero/screens/mvp_route/ui/textstyle.dart';

const double _HEADLINEFONTSIZE = 24;
const double _YHEIGHTFACTOR = 0.0869;

class Headline extends StatelessWidget {
  final String childtext;
  const Headline(this.childtext);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
            padding:
                EdgeInsets.only(top: _YHEIGHTFACTOR * getScreenHeight(context)),
            child: Text(
              childtext,
              style: GoZeroTextStyles.semibold(_HEADLINEFONTSIZE),
            )));
  }
}
