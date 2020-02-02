import 'package:flutter/material.dart';

import '../images.dart';
import '../screensize.dart';
import '../textstyle.dart';

Widget bulletPoint(BuildContext context, List<TextSpan> infotext) {
  return Padding(
      padding: EdgeInsets.only(bottom: 0.02 * getScreenHeight(context), left: 0.037 * getScreenWidth(context)),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GoZeroIcons.globe,
          Padding(
              padding: EdgeInsets.only(
                  left: //GAPMULTIPLIER *
                      0.017 * getScreenWidth(context)),
              child: RichText(
                  text: TextSpan(
                      style: GoZeroTextStyles.regular(14), children: infotext)))
        ],
      ));
}
//TODO: Methode zur Generierung von Richtext mit Bold usw. (3 Teile als Parameter)
