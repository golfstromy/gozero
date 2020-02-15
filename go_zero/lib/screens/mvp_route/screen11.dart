import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/pressAnywhereLabel.dart';

import 'ui/colors.dart';
import 'ui/screensize.dart';
import 'ui/textstyle.dart';
import 'ui/widgets/colorfulCircle.dart';

const int INDEX = 9;
const String NEXTSCREEN = "/screen12";
const Color _BACKGROUNDCOLOR = GoZeroColors.green;

const double _YHEIGHTFACTORBIGCIRCLE = 172 / 667;
const double _XFACTORBIGCIRLCE = 55 / 375;
const double _CONGRATSFONTSIZE = 24;
//TODO: Implement white logo

class CongratulationsScreen extends StatefulWidget {
  @override
  _CongratulationsScreenState createState() => _CongratulationsScreenState();
}

class _CongratulationsScreenState extends State<CongratulationsScreen> {
  @override
  Widget build(BuildContext context) {
    final String compensatedtimeUnit =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, NEXTSCREEN);
      },
      child: Stack(children: <Widget>[
        Container(color: _BACKGROUNDCOLOR),
        Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.only(
                    left: _XFACTORBIGCIRLCE * getScreenWidth(context),
                    top: _YHEIGHTFACTORBIGCIRCLE * getScreenHeight(context)),
                child: ColorfulCircle(
                  0.0,
                  unit: compensatedtimeUnit,
                  borderColor: Colors.white,
                ))),
        Center(child: Padding(padding: EdgeInsets.only(top: 0.633 * getScreenHeight(context), ), child: Text(
          "Congratulations! \nYou are living climate \nneutral & are saving our\nbeloved planet!",
          textAlign: TextAlign.center,
          style:
              GoZeroTextStyles.semibold(_CONGRATSFONTSIZE, color: Colors.white, ),
        ),),),
        pressAnywhere(context, color: Colors.white),
      ]),
    ));
  }
}
