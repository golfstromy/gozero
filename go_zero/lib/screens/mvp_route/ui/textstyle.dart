import 'package:flutter/material.dart';

abstract class GoZeroTextStyles {

static const double MULTIPLIER = 1;
static const double DEFAULTBOLDSIZE = MULTIPLIER * 24;
static const double DEFAULTREGULARSIZE = MULTIPLIER * 9;

  static TextStyle semibold(
      {Color color = Colors.black, double fontSize = DEFAULTBOLDSIZE}) {
    return TextStyle(
        color: color,
        fontFamily: "Montserrat",
        fontSize: fontSize,
        fontWeight: FontWeight.w600);
  }

  static TextStyle bold({Color color = Colors.black, double fontSize = DEFAULTBOLDSIZE}) {
    return TextStyle(
        color: color,
        fontFamily: "Montserrat",
        fontSize: fontSize,
        fontWeight: FontWeight.bold);
  }


  static TextStyle regular({Color color = Colors.black, double fontSize = DEFAULTREGULARSIZE}) {
    return TextStyle(
      color: color,
      fontFamily: "Montserrat",
      fontSize: fontSize,
    );
  }


static TextStyle regularLetterSpaced({Color color = Colors.black, double fontSize = DEFAULTREGULARSIZE, double letterSpacing = 0.16*DEFAULTREGULARSIZE}) {
    return TextStyle(
      color: color,
      fontFamily: "Montserrat",
      fontSize: fontSize,
      letterSpacing: letterSpacing,
    );
  }  
}
