import 'package:flutter/material.dart';

import '../images.dart';
import '../screensize.dart';
import '../textstyle.dart';

const double _TEXTSIZE = 14;

Widget bulletPoint(BuildContext context, List<TextSpan> infotext) {
  return Padding(
      padding: EdgeInsets.only(bottom: 0.023 * getScreenHeight(context), left: 0.037 * getScreenWidth(context)),
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
                      style: GoZeroTextStyles.regular(_TEXTSIZE), children: infotext)))
        ],
      ));
}
//TODO: Generalize generation of bulletpoints, z.B. map String text:String fontstyle, "Global" : "regular" // see ordered_bulletpoint