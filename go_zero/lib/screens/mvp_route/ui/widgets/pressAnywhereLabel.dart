import 'package:flutter/material.dart';

import '../colors.dart';
import '../screensize.dart';
import '../textstyle.dart';

Widget pressAnywhere(BuildContext context,
    [Color color = GoZeroColors.yellow]) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: EdgeInsets.only(bottom: SMALLGAP(context)),
      child: Text("PRESS ANYWHERE TO CONTINUE",
          textAlign: TextAlign.center,
          style: GoZeroTextStyles.regularLetterSpaced(color: color)),
    ),
  );
}
