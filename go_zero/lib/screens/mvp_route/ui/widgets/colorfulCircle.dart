import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/textstyle.dart';
import '../screensize.dart';
import 'circle.dart';

import '../colors.dart';

const double _DEFAULTSIZEFACTOR = DEFAULTWIDTHFACTOR;
const double _BIGFONTSIZE = 70;

class ColorfulCircle extends StatefulWidget {
  final double number;
  final String unit;
  final List<Color> colors;
  final List<IconData> icons;
  final double fontSize;

  ColorfulCircle(this.number,
      {this.unit = "",
      this.colors = const [GoZeroColors.green],
      this.icons = const [],
      this.fontSize = _BIGFONTSIZE});

  @override
  _ColorfulCircleState createState() => _ColorfulCircleState();
}

class _ColorfulCircleState extends State<ColorfulCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: _DEFAULTSIZEFACTOR * getScreenWidth(context),
        height: _DEFAULTSIZEFACTOR * getScreenWidth(context),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: GoZeroColors.controlGrey, width: 2)),
        child: RichText(
            text: TextSpan(
                style: GoZeroTextStyles.bold(fontSize: widget.fontSize),
                text: widget.number.toString().replaceAll(".", ","),
                )));
  }
}
