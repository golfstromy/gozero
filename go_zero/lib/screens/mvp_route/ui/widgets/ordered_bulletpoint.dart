import 'package:flutter/material.dart';

import '../colors.dart';
import '../images.dart';
import '../screensize.dart';
import '../textstyle.dart';

const double _NUMBERFONTSIZE = 17;
const double _TEXTSIZE = 14;
const double _FINEPRINTSIZE = 7; //TODO: RESET

Widget getStepsAsCol(BuildContext context, List<String> texts,
    {List<int> fineprintIndex = const []}) {
  return Column(
    children: fineprintIndex.length == 0
        ? getSteps(context, texts)
        : getSteps(context, texts, fineprintIndex: fineprintIndex),
  );
}

List<Widget> getSteps(BuildContext context, List<String> texts,
    {List<int> fineprintIndex = const []}) {
  List<Widget> steps = [];
  int numToPrint = 1;
  int amountPreviousFP = 0;
  for (int i = 0; i < texts.length; i++) {
    String text = texts[i];
    numToPrint = i + 1 - amountPreviousFP;
    bool fineprint = false;
    for (int index in fineprintIndex) {
      fineprint = (i + 1 == index);
      if (fineprint) {
        break;
      }
    }
    fineprint
        ? steps
            .add(singleStep(context, numToPrint, text, fineprint: texts[i + 1]))
        : steps.add(singleStep(context, numToPrint, text));

    if (fineprint) {
      i++;
      amountPreviousFP++;
    }
  }
  return steps;
}


Widget singleStep(BuildContext context, int numToPrint, String text,
    {String fineprint = ""}) {
  return Padding(
      padding: EdgeInsets.only(
          bottom: 0.023 * getScreenHeight(context),
          left: 0.037 * getScreenWidth(context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            //TODO: FIX ALIGNMENT --> width: ...,
            child: RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: "#",
                  style: GoZeroTextStyles.regular(_NUMBERFONTSIZE,
                      color: GoZeroColors.green)),
              TextSpan(
                  text: numToPrint.toString(),
                  style: GoZeroTextStyles.regular(_NUMBERFONTSIZE))
            ])),
          ),
          Padding(
              padding: EdgeInsets.only(left: 0.017 * getScreenWidth(context)),
              child: RichText(
                  text: TextSpan(
                      style: GoZeroTextStyles.regular(_TEXTSIZE),
                      children: <TextSpan>[
                    TextSpan(text: text + "\n"),
                    TextSpan(
                        text: fineprint,
                        style: GoZeroTextStyles.regular(_FINEPRINTSIZE))
                  ])))
        ],
      ));
}

//TODO: Welcher Schriftstil bei Nummer #n
