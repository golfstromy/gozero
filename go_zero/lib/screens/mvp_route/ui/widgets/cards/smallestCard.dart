import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../screensize.dart';
import 'customCard.dart';

const double _SMALLESTCARDFONTSIZE = 14;

class SmallestCard extends StatefulWidget {
  final bool selectable;
  final bool textSelectable;
  final String text;
  final Widget child;
  const SmallestCard(
      {Key key,
      this.selectable = true,
      this.text,
      this.child,
      this.textSelectable = false})
      : super(key: key);

  @override
  _SmallestCardState createState() => _SmallestCardState();
}

class _SmallestCardState extends State<SmallestCard> {
  @override
  Widget build(BuildContext context) {
    double _WIDTH = 0.208 * getScreenWidth(context);
    return widget.selectable
        ? widget.textSelectable
            ? OnlyTextSelectableCustomCard(
                //height: Cards.DEFAULTCARDHEIGHTFACTOR * getScreenHeight(context),
                text: widget.text,
                width: _WIDTH,
                fontSize: _SMALLESTCARDFONTSIZE,
              )
            : CustomCard(
                //height: Cards.DEFAULTCARDHEIGHTFACTOR * getScreenHeight(context),
                child: widget.child,
                width: _WIDTH,
              )
        : CustomCardWithoutSelection(
            //height: Cards.DEFAULTCARDHEIGHTFACTOR * getScreenHeight(context),
            child: widget.child,
            width: _WIDTH,
            color: GoZeroColors.controlBackground);
  }
}
