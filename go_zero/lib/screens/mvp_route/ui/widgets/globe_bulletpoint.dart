import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/alternatingText.dart';

import '../images.dart';
import '../screensize.dart';
import '../textstyle.dart';

const double _TEXTSIZE = 14;
const double _BULLETPOINTFONTSIZE = 14;
Widget _ICON = GoZeroIcons.globe;

List<Widget> generateBulletpoints(
    BuildContext context, List<String> stringContents,
    {TextStyle specialStyle}) {
  List<List<TextSpan>> contents = [];
  for (String s in stringContents)
    contents.add(getAlternatingText(
        s, specialStyle ?? GoZeroTextStyles.semibold(_BULLETPOINTFONTSIZE)));

  List<Widget> bulletpoints = [];
  for (List<TextSpan> content in contents)
    bulletpoints.add(bulletPoint(context, content));

  return bulletpoints;
}

Widget bulletPoint(BuildContext context, List<TextSpan> infotext) {
  return Padding(
      padding: EdgeInsets.only(
          bottom: 0.023 * getScreenHeight(context), 
          left: 0.037 * getScreenWidth(context)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _ICON,
          Padding(
              padding: EdgeInsets.only(left: 0.017 * getScreenWidth(context)),
              child: RichText(
                  text: TextSpan(
                      style: GoZeroTextStyles.regular(_TEXTSIZE),
                      children: infotext)))
        ],
      ));
}
