import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/textstyle.dart';

const double _HEADLINEFONTSIZE = 24;

class Headline extends StatelessWidget {
  final String s;
  const Headline(this.s);

  @override
  Widget build(BuildContext context) {
    return Text(
      s, style: GoZeroTextStyles.semibold(_HEADLINEFONTSIZE),
    );
  }
}

