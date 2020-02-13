import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/textstyle.dart';
import '../screensize.dart';
import 'circle.dart';

import '../colors.dart';

const double _DEFAULTSIZEFACTOR = DEFAULTWIDTHFACTOR;
const double _BIGFONTSIZE = 56;
const double _SMALLFONTSIZE = 13;

class ColorfulCircle extends StatefulWidget {
  final double number;
  final String unit;
  final List<Color> colors;
  final List<IconData> icons;
  final double fontSize;
  final double unitFontSize;

  ColorfulCircle(this.number,
      {this.unit = "",
      this.colors = const [GoZeroColors.green],
      this.icons = const [],
      this.fontSize = _BIGFONTSIZE,
      this.unitFontSize = _SMALLFONTSIZE});

  @override
  _ColorfulCircleState createState() => _ColorfulCircleState();
}

class _ColorfulCircleState extends State<ColorfulCircle> {
  @override
  Widget build(BuildContext context) {
    //TODO: Add colorfullness
    return Container(
        width: _DEFAULTSIZEFACTOR * getScreenWidth(context),
        height: _DEFAULTSIZEFACTOR * getScreenWidth(context),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: GoZeroColors.controlGrey, width: 2)),
        child: Stack(
          children: <Widget>[
            Align(
                alignment: Alignment.center,
                child: Text(widget.number.toString().replaceAll(".", ","),
                    style: GoZeroTextStyles.semibold(widget.fontSize))),
            Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 16 / 375 * getScreenWidth(context),
                      top: 25 / 667 * getScreenHeight(context), //TODO: Only estimated value, fix it properly
                      //bottom: 99 / 667 * getScreenHeight(context)
                      ),
                  child: Text(widget.unit,
                      textAlign: TextAlign.right,
                      style: GoZeroTextStyles.semibold(widget.unitFontSize)),
                )),
          ],
        ));
  }
}

/*
RichText(textAlign: TextAlign.left,
            text: TextSpan(
          style: GoZeroTextStyles.semibold(widget.fontSize),
          children: <TextSpan>[
            TextSpan(text: widget.number.toString().replaceAll(".", ",")),
            TextSpan(
                text: "  " + widget.unit, style: GoZeroTextStyles.semibold(widget.unitFontSize)),
          ],
        ))*/
