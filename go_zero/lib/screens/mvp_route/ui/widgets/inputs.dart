import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/textstyle.dart';

import '../colors.dart';
import '../screensize.dart';

const double _SUBHEADLINEFONTSIZE = 14;
const double _ICONSIZE = 16;

Widget subHeadline(BuildContext context, IconData icon, String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        children: <Widget>[
          Icon(
            Icons.person,
            size: _ICONSIZE,
            color: GoZeroColors.yellow,
          ),
          Padding(
              padding: EdgeInsets.only(left: 0.032 * getScreenWidth(context)),
              child: Text(title,
                  style: GoZeroTextStyles.regular(_SUBHEADLINEFONTSIZE)))
        ],
      ),
      Padding(
          padding: EdgeInsets.only(top: 0.0075 * getScreenHeight(context)),
          child: Container(
              width: 0.872 * getScreenWidth(context),
              height: 0.0014 * getScreenHeight(context),
              color: GoZeroColors.controlGrey))
    ],
  );
}

const double _WIDECARDFONTSIZE = 14;
const double _WIDECARDBORDERWIDTH = 1 / 4;
Widget wideSelectionCard(BuildContext context, String text, Widget image) {
  //TODO: Function als Argument übergeben oder als CustomWidgetClass: https://stackoverflow.com/questions/50783354/how-to-highlight-the-border-of-a-card-selected

  bool selected = false;
  return GestureDetector(
    onTap: () {
      selected = !selected;
      print(selected);
    },
    child: Container(
      //height: 0.068 * getScreenHeight(context),
      width: 0.768 * getScreenWidth(context),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: selected ? GoZeroColors.green : GoZeroColors.controlGrey),
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: GoZeroColors.controlBackground,
        elevation: 4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              trailing: image,
              title: Text(text,
                  style: GoZeroTextStyles.regular(_WIDECARDFONTSIZE)),
            ),
          ],
        ),
      ),
    ),
  );
}

const double _SMALLCARDFONTSIZE = 14;
Widget smallSelectionCard(BuildContext context, String text) {
  return Container(
    //height: 0.069 * getScreenHeight(context),
    width: 0.208 * getScreenWidth(context),
    child: Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: GoZeroColors.green),
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: GoZeroColors.controlBackground,
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text(text,
                style: GoZeroTextStyles.regular(_SMALLCARDFONTSIZE,
                    color: GoZeroColors.green)),
          ),
        ],
      ),
    ),
  );
}
