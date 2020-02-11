import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_zero/backend/screenInfo.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/cards/smallestCard.dart';

import '../../colors.dart';
import '../../screensize.dart';
import '../../textstyle.dart';

const double _SLIDERFONTSIZE = QuestionScreen.SLIDERFONTSIZE;
const double _SLIDERTEXTMARGINFCT = QuestionScreen.SLIDERTEXTMARGINFCT;

class SliderWithTextInput extends StatefulWidget {
  final TextEditingController controller;
  final double min;
  final double max;
  final ValueChanged onChangedText;
  final ValueChanged onChangedSlider;
  final Object val;
  final EdgeInsets padding;

  SliderWithTextInput(
      {@required this.controller,
      @required this.min,
      @required this.max,
      @required this.onChangedText,
      @required this.onChangedSlider,
      @required this.val,
      this.padding});

  @override
  _SliderWithTextInputState createState() => _SliderWithTextInputState();
}

class _SliderWithTextInputState extends State<SliderWithTextInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: widget.padding ?? EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SmallestCard(
              setHeight: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        //TODO: Optimierung Anzeige
                        left: _SLIDERTEXTMARGINFCT * getScreenWidth(context),
                        right: _SLIDERTEXTMARGINFCT * getScreenWidth(context)),
                    child: TextField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(3),
                        ],
                        style: GoZeroTextStyles.regular(_SLIDERFONTSIZE,
                            color: GoZeroColors.green),
                        decoration: InputDecoration(border: InputBorder.none),
                        controller: widget.controller,
                        keyboardType: TextInputType.number,
                        onChanged: widget.onChangedText),
                  )
                ],
              ),
              selectable: false,
            ),
            Slider(
              //TODO: Nur ganzzahlig Option
              min: widget.min,
              max: widget.max,
              onChanged: widget.onChangedSlider,
              value: widget.val,
            )
          ],
        ));
  }
}
