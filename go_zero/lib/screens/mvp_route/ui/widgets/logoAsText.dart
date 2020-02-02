import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/textstyle.dart';

import '../colors.dart';

TextSpan logoAsText([double fontSize]) {
  return TextSpan(children: <TextSpan>[
    TextSpan(
        text: "go",
        style: fontSize != null
            ? GoZeroTextStyles.bold(fontSize: fontSize)
            : GoZeroTextStyles.bold()),
    TextSpan(
        text: "zero",
        style: fontSize != null
            ? GoZeroTextStyles.regular(fontSize, color: GoZeroColors.green)
            : GoZeroTextStyles.regular(null, color: GoZeroColors.green))
  ]);
}

RichText logoAsRichText([double fontSize]) {
  return RichText(text: fontSize != null ? logoAsText(fontSize) : logoAsText());
}
