import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/textstyle.dart';

List<TextSpan> getAlternatingText(
    String txtWithStyle, TextStyle specialStyle, //BSP: "Das ist *ein* Test"
    {TextStyle normalStyle,
    String separatator = "*"}) {
  // --> split[0] = "Das ist ein "
  List<String> split = txtWithStyle.split(separatator); // --> split[1] = "ein"
  List<TextSpan> res = []; // --> split[2] = " Test"
  for (int i = 0; i < split.length; i += 2) {
    if (normalStyle != null)
      res.add(TextSpan(text: split[i], style: normalStyle));
    else
      res.add(TextSpan(text: split[i]));

    if (i != split.length - 1)
      res.add(TextSpan(text: split[i + 1], style: specialStyle));
  }
  return res;
}

RichText getAlternatingRichText(
    String txtWithStyle, TextStyle specialStyle, TextStyle usualStyle,
    {String separatator = "*"}) {
  List<String> split = txtWithStyle.split(separatator);
  return RichText(
    text: TextSpan(
        children: getAlternatingText(txtWithStyle, specialStyle,
            normalStyle: usualStyle, separatator: separatator)),
  );
}
