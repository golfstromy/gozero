import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/textstyle.dart';

import '../colors.dart';
import '../screensize.dart';

Widget continueButton(BuildContext context, String nextScreen) {
  return Align(
    alignment: Alignment.topCenter,
    child: Padding(
        padding: EdgeInsets.only(top: (620 / 667) * getScreenHeight(context)),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 2),
              borderRadius: BorderRadius.circular(15)),
          color: GoZeroColors.green,
          //TODO: Ästhethisch gestalten & positionieren
          child: Text(
            "CONTINUE",
            style: GoZeroTextStyles.regular(12, color: GoZeroColors.controlBackground),
          ),
          onPressed: () {
            Navigator.pushNamed(context, nextScreen);
          },
        )),
  );
}
