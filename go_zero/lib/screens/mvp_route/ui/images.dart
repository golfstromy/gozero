import 'package:flutter/material.dart';

const String LOGOWITHOUTARROWS = "assets/logo/logoWA4x.png";
const String TOPARROW = "assets/arrows/topArrow.png";
const String BOTTOMARROW = "assets/arrows/bottomArrowSmall.png";

const String CALCULATEFOOTPRINT = "assets/calculateFootprint.png";
const String OFFSETFOOTPRINT = "assets/offsetFootprint.png";
const String SHARE = "assets/share.png";

const String GLOBEICON = "assets/icons/globe4x.png";
const String MALEICON = "assets/icons/male4x.png";
const String FEMALEICON = "assets/icons/female4x.png";

abstract class GoZeroIcons {
  static final Widget globe = Image.asset(GLOBEICON, width: 16, height: 16);
  static final Widget male =
      Image.asset(MALEICON, scale: 0.25, fit: BoxFit.fitHeight);
  static final Widget female =
      Image.asset(FEMALEICON, scale: 0.25, fit: BoxFit.fitHeight);
}
