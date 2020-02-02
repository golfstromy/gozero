import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/screen1.dart';
import 'package:go_zero/screens/mvp_route/screen2.dart';
import 'package:go_zero/screens/mvp_route/screen4.dart';

import 'screens/mvp_route/screen3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        '/screen4': (context) => CalculateIntroScreen()
      },
    );
  }
}
