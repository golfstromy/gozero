import 'package:flutter/material.dart';

import '../../screensize.dart';
import '../../textstyle.dart';
import 'customCard.dart';

const double _WIDECARDFONTSIZE = 14;
const double _WIDECARDBORDERWIDTH =
    1 / 4; //1:MockupPxWdth; TODO: In Signatur übertragen

class WideSelectionCard extends StatefulWidget {
  final String text;
  final Widget image;
  final bool textSelectable;

  const WideSelectionCard(
      {Key key, this.text, this.image, this.textSelectable = true})
      : super(key: key);

  @override
  _WideSelectionCardState createState() => _WideSelectionCardState();
}

class _WideSelectionCardState extends State<WideSelectionCard> {
  @override
  Widget build(BuildContext context) {
    return widget.textSelectable
        ? TextSelectableCustomCard(widget.text, _WIDECARDFONTSIZE , image: widget.image, 
            //  height: Cards.DEFAULTCARDHEIGHTFACTOR * getScreenHeight(context),
            width: 0.768 * getScreenWidth(context),
          )
        : CustomCard(
            //  height: Cards.DEFAULTCARDHEIGHTFACTOR * getScreenHeight(context),
            width: 0.768 * getScreenWidth(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  trailing: widget.image,
                  title: Text(widget.text,
                      style: GoZeroTextStyles.regular(_WIDECARDFONTSIZE)),
                ),
              ],
            ),
          );
  }
}
