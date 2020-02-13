import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/pressAnywhereLabel.dart';

import 'ui/colors.dart';

const int INDEX = 9;
const String NEXTSCREEN = "/screen12";

class CongratulationsScreen extends StatefulWidget {
  @override
  _CongratulationsScreenState createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NEXTSCREEN);
      },
      child: Stack(children: <Widget>[
        Container(color: GoZeroColors.green),
        pressAnywhere(context, color: Colors.white),
      ]),
    ));
  }
}
