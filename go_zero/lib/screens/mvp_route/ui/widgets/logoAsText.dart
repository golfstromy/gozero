import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/textstyle.dart';

import '../colors.dart';

const double _DEFAULTFONTSIZE = 24;

TextSpan logoAsText([double fontSize]) {
  return TextSpan(children: <TextSpan>[
    TextSpan(
        text: "go",
        style: fontSize != null
            ? GoZeroTextStyles.semibold(fontSize) //TODO: SEMIBOLD!
            : GoZeroTextStyles.semibold(_DEFAULTFONTSIZE)),
    TextSpan(
        text: "zero",
        style: fontSize != null
            ? GoZeroTextStyles.regular(fontSize, color: GoZeroColors.green)
            : GoZeroTextStyles.regular(_DEFAULTFONTSIZE, color: GoZeroColors.green))
  ]);
}

RichText logoAsRichText([double fontSize]) {
  return RichText(text: fontSize != null ? logoAsText(fontSize) : logoAsText());
}
