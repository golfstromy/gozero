import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_zero/screens/mvp_route/screen5.dart';

import 'screens/mvp_route/screen1.dart';
import 'screens/mvp_route/screen2.dart';
import 'screens/mvp_route/screen3.dart';
import 'screens/mvp_route/screen4.dart';
import 'screens/mvp_route/screen12.dart';
import 'screens/mvp_route/screen9.dart';

Future main() async {
  runApp(GoZeroApp());
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]); 
}

class GoZeroApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoZero',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: InitScreen(),
      initialRoute: '/init',
      routes: {
        '/init': (context) => InitScreen(),
        '/screen2': (context) => ChallengeScreen(),
        '/screen3': (context) => HowItWorksScreen(),
        '/screen4': (context) => CalculateIntroScreen(),
        '/screen5': (context) => MyPersonScreen(),

        '/screen9': (context) => OffsetIntroScreen(),
        '/screen12': (context) => ShareIntroScreen(),
        '/finish': (context) => InitScreen()
      },
    );
  }
}
//TODO: '/finish' screen
