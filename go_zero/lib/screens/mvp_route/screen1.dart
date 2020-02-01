import 'package:flutter/material.dart';
import 'ui/colors.dart';
import 'ui/screensize.dart';
import 'ui/textstyle.dart';
import 'ui/widgets/circle.dart';

class InitScreen extends StatefulWidget {
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
         // Column(
           // children: <Widget>[
              //Image.asset("/assets/logoWithoutArrows.png"),
              Container(
                  child: Align(
                alignment: Alignment.center,
                child: bigCircle(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Show our planet",
                            style: GoZeroTextStyles.semibold()),
                        RichText(
                            text: TextSpan(
                          style: GoZeroTextStyles.bold(),
                          children: <TextSpan>[
                            TextSpan(text: "some "),
                            TextSpan(
                                text: "love",
                                style: GoZeroTextStyles.semibold(
                                    color: GoZeroColors.green)),
                            TextSpan(text: "."),
                          ],
                        ))
                      ]),
                ),
              )),
            //],
          //),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: getScreenHeight(context) * 0.05),
              child: Text("PRESS ANYWHERE TO CONTINUE",
                  textAlign: TextAlign.center,
                  style: GoZeroTextStyles.regularLetterSpaced(
                      color: GoZeroColors.yellow)),
            ),
          )
        ],
      ),
    );
  }
}
