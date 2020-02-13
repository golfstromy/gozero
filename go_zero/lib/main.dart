import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/mvp_route/screen1.dart';
import 'screens/mvp_route/screen2.dart';
import 'screens/mvp_route/screen3.dart';
import 'screens/mvp_route/screen4.dart';
import 'screens/mvp_route/screen5.dart';
import 'screens/mvp_route/screen6.dart';
import 'screens/mvp_route/screen7.dart';
import 'screens/mvp_route/screen8.dart';
import 'screens/mvp_route/screen9.dart';
import 'screens/mvp_route/screen10.dart';
import 'screens/mvp_route/screen11.dart';
import 'screens/mvp_route/screen12.dart';

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
        '/screen6': (context) => LivingScreen(),
        '/screen7': (context) => MobilityScreen(),
        '/screen8': (context) => FootPrintResultScreen(),
        '/screen9': (context) => OffsetIntroScreen(),
        '/screen10': (context) => CompensateScreen(),
        '/screen11': (context) => CongratulationsScreen(),
        '/screen12': (context) => ShareIntroScreen(),
        '/finish': (context) => InitScreen()
      },
    );
  }
}
//TODO: '/finish' screen
