//---------------------CUSTOMIZED/TEMPLATE FOR SUBTYPES---------------------------------------
import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/colors.dart';

import '../../textstyle.dart';

class CustomCard extends StatefulWidget {
  final double width;
  final double height;
  final Widget child;

  const CustomCard({Key key, this.width, this.height, this.child})
      : super(key: key);

  @override
  CustomCardState createState() => CustomCardState();
}

class CustomCardState extends State<CustomCard> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color:
                      selected ? GoZeroColors.green : GoZeroColors.controlGrey),
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: GoZeroColors.controlBackground,
            elevation: 4,
            child: widget.child),
      ),
    );
  }
}

class CustomCardWithoutSelection extends StatefulWidget {
  final double width;
  final double height;
  final Widget child;
  final Color color;

  const CustomCardWithoutSelection(
      {Key key, this.width, this.height, this.child, this.color})
      : super(key: key);

  @override
  CustomCardWithoutSelectionState createState() =>
      CustomCardWithoutSelectionState();
}

class CustomCardWithoutSelectionState
    extends State<CustomCardWithoutSelection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: widget.color),
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: GoZeroColors.controlBackground,
          elevation: 4,
          child: widget.child),
    );
  }
}

class OnlyTextSelectableCustomCard extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final double fontSize;

  const OnlyTextSelectableCustomCard(
      {Key key, this.width, this.height, this.text, this.fontSize})
      : super(key: key);

  @override
  OnlyTextSelectableCustomCardState createState() =>
      OnlyTextSelectableCustomCardState();
}

class OnlyTextSelectableCustomCardState
    extends State<OnlyTextSelectableCustomCard> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Container(
          width: widget.width,
          height: widget.height,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color:
                      selected ? GoZeroColors.green : GoZeroColors.controlGrey),
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: GoZeroColors.controlBackground,
            elevation: 4,
            child: ListTile(
                title: Center(
                    child: Text(widget.text,
                        style: GoZeroTextStyles.regular(widget.fontSize,
                            color: selected
                                ? GoZeroColors.green
                                : GoZeroColors.defaultText)))),
          ),
        ));
  }
}

class TextSelectableCustomCard extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final Widget image;
  final double fontSize;

  const TextSelectableCustomCard(this.text, this.fontSize,
      {Key key, this.width, this.height, this.image})
      : super(key: key);

  @override
  TextSelectableCustomCardState createState() =>
      TextSelectableCustomCardState();
}

class TextSelectableCustomCardState extends State<TextSelectableCustomCard> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Container(
          width: widget.width,
          height: widget.height,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color:
                      selected ? GoZeroColors.green : GoZeroColors.controlGrey),
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: GoZeroColors.controlBackground,
            elevation: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  trailing: widget.image != null ? widget.image : Container(),
                  title: Text(widget.text,
                      style: GoZeroTextStyles.regular(widget.fontSize,
                          color: selected ? GoZeroColors.green : GoZeroColors.defaultText)),
                ),
              ],
            ),
          ),
        ));
  }
}
