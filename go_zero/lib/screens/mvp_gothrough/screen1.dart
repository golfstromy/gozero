import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_gothrough/ui/circle.dart';

class InitScreen extends StatefulWidget {
  @override
  _InitScreenState createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Align(
        alignment: Alignment.center,
        child: bigCircle(
          child: Text(
            "Show our planet\nsome love.",
            textAlign: TextAlign.center,
          ),
        ),
      )),
    );
  }
}
