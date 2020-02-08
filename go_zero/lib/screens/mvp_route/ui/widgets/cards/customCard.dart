//---------------------CUSTOMIZED/TEMPLATE FOR SUBTYPES---------------------------------------
import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/colors.dart';

import '../../textstyle.dart';

class CustomCard extends StatefulWidget {
  final double width;
  final double height;
  final Widget child;
  bool selected = false;

  bool getSelected() {
    return selected;
  }

  void setSelected(bool val) {
    selected = val;
  }

  CustomCard({Key key, this.width, this.height, this.selected, this.child})
      : super(key: key);

  @override
  CustomCardState createState() => CustomCardState();
}

class CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selected = !widget.selected;
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: widget.selected
                      ? GoZeroColors.green
                      : GoZeroColors.controlGrey),
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
  final bool unselectable;
  final ValueChanged<bool> onChanged;
  final Widget image;
  final double fontSize;
  bool selected;

  TextSelectableCustomCard(
    this.text,
    this.fontSize, {
    Key key,
    this.width,
    this.height,
    this.image,
    this.unselectable = true,
    this.onChanged,
    this.selected = false,
  }) : super(key: key);

  @override
  TextSelectableCustomCardState createState() =>
      TextSelectableCustomCardState();
}

class TextSelectableCustomCardState extends State<TextSelectableCustomCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            if (widget.unselectable || !widget.selected) {
              widget.selected = !widget.selected;
              widget.onChanged(widget.selected);
            }
            //if unselectable, swap state onTap.
            //otherwise, only swap state if the card is not selected
          });
        },
        child: Container(
          width: widget.width,
          height: widget.height,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: widget.selected
                      ? GoZeroColors.green
                      : GoZeroColors.controlGrey),
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: GoZeroColors.controlBackground,
            elevation: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  trailing: widget.image != null ? widget.image : SizedBox(),
                  title: Text(widget.text,
                      style: GoZeroTextStyles.regular(widget.fontSize,
                          color: widget.selected
                              ? GoZeroColors.green
                              : GoZeroColors.defaultText)),
                ),
              ],
            ),
          ),
        ));
  }
}
