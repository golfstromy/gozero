import 'package:flutter/material.dart';

import 'ui/customScreenTemplate/introscreen.dart';
import 'ui/images.dart';

const int INDEX = 2;

class CalculateIntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return introscreen(context, 1, CALCULATEFOOTPRINT,
        "Calculate your\npersonal CO2 footprint", INDEX, "/screen5");
  }
}
