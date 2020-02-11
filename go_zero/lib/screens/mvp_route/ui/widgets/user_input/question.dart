
import 'package:flutter/material.dart';

import '../../screensize.dart';
import '../inputs.dart';

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
