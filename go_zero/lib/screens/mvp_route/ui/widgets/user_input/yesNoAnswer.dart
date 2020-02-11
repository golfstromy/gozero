import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/screensize.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/cards/grouped/groupedSmallGridCard.dart';

const double _WIDTHFACTOR = 139 / 375;
const double _GAPBETWEENCARDS = 10 / 375;
const double _FONTSIZE = 14;
const double _PADDINGLEFTFCT = 45 / 375;

class YesNoAnswer extends StatefulWidget {
  final EdgeInsets padding;

  YesNoAnswer({Key key, this.padding}) : super(key: key);
  @override
  _YesNoAnswerState createState() => _YesNoAnswerState();
}

class _YesNoAnswerState extends State<YesNoAnswer> {
  @override
  Widget build(BuildContext context) {
    return SelectableSmallCardGrid(
      texts: ["Yes", "No"],
      cardWidthFactor: _WIDTHFACTOR,
      checked: ["Yes"],
      crossAxisCount: 2,
      innerSpacing:
          EdgeInsets.only(right: _GAPBETWEENCARDS * getScreenWidth(context)),
      fontSize: _FONTSIZE,
      padding: widget.padding ??
          EdgeInsets.only(left: _PADDINGLEFTFCT * getScreenWidth(context)),
    );
  }
}
