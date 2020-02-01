import 'package:flutter/material.dart';

const String LOGOWITHOUTARROWS = "assets/logoWithoutArrows.png";
const String LEFTARROW = "assets/arrows/leftArrow.png";
const String RIGHTARROW = "assets/arrows/rightArrow.png";

Widget LOGOWIDGET = Column(
  children: <Widget>[
    Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: Image.asset(RIGHTARROW),
    ),
    Image.asset(LOGOWITHOUTARROWS),
    Padding(
      padding: EdgeInsets.only(top: 6),
      child: Image.asset(LEFTARROW),
    ),
  ],
);
