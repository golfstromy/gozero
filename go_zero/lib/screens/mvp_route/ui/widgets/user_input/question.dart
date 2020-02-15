
import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../screensize.dart';
import '../inputs.dart';

List<Widget> question(BuildContext context,
    {double topPadding = 0,
    Color iconColor = GoZeroColors.yellow,
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
        child: subHeadline(context, subheadlineIcon, subheadlineText, iconColor: iconColor)),
  );
  items.add(possibleAnswers);
  return items;
}
