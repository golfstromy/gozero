import 'package:flutter/material.dart';

import 'ui/customScreenTemplate/introscreen.dart';
import 'ui/images.dart';

const int index = 7;

class OffsetIntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return introscreen(context, 2, OFFSETFOOTPRINT,
        "Offset your\npersonal CO2 footprint", index, "/screen10");
  }
}
