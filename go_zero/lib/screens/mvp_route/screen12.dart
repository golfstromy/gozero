import 'package:flutter/material.dart';

import 'ui/customScreenTemplate/introscreen.dart';
import 'ui/images.dart';

const int index = 10;

class ShareIntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return introscreen(context, 3, SHARE,
        "Share your\nenvironmental impact with\nyour family and friends", index, "/finish");
  }
}
