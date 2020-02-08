import 'package:flutter/material.dart';

import '../../../screensize.dart';
import '../customCard.dart';
import 'groupedOrientations.dart';

class SelectableSmallCardGrid extends StatefulWidget {
  ///Texts in the Card
  final List<String> texts;

  ///how big the cards width is
  final double cardWidthFactor;

  ///how many cols the grid has
  final int columns;

  final double fontSize;

  ///Which cards are selected
  final List<String> checked;

  /// Called when the value of the SelectableSmallCardGrid changes.
  final void Function(bool isChecked, String label, int index) onChange;

  /// Called when the user makes a selection.
  final void Function(List<String> selected) onSelected;

  /// The style to use for the texts.
  final TextStyle textStyle;

  /// Specifies the orientation to display elements.
  final GroupedCardOrientation orientation;

  /// Called when needed to build a SelectableSmallCardGrid element.
  final Widget Function(TextSelectableCustomCard card, int index) itemBuilder;

  /// If true the Card's value can be true, false, or null.
  final bool tristate;

  final int crossAxisCount;

  //SPACING STUFF
  final EdgeInsetsGeometry innerSpacing;

  /// Empty space in which to inset the SelectableSmallCardGrid.
  final EdgeInsetsGeometry padding;

  /// Empty space surrounding the SelectableSmallCardGrid.
  final EdgeInsetsGeometry margin;

  SelectableSmallCardGrid({
    Key key,
    @required this.texts,
    this.columns = 2,
    this.fontSize = 14,
    this.checked,
    this.onChange,
    this.crossAxisCount = 2,
    this.cardWidthFactor =
        137 / 375, //Mockupwidth of small card:mockup screen width
    this.innerSpacing = const EdgeInsets.only(top: 0),
    this.onSelected,
    this.textStyle = const TextStyle(),
    this.tristate = false,
    this.orientation = GroupedCardOrientation.VERTICAL,
    this.itemBuilder,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
  }) : super(key: key);

  @override
  _SelectableSmallCardGridState createState() =>
      _SelectableSmallCardGridState();
}

class _SelectableSmallCardGridState extends State<SelectableSmallCardGrid> {
  List<String> _selected = [];
  double _SCREENWIDTH;

  @override
  void initState() {
    super.initState();

    //set the selected to the checked (if not null)
    _selected = widget.checked ?? [];
  }

  @override
  Widget build(BuildContext context) {
    //set the selected to the checked (if not null)
    _SCREENWIDTH = getScreenWidth(context);
    if (widget.checked != null) {
      _selected = [];
      _selected.addAll(widget.checked); //use add all to prevent a shallow copy
    }

    List<Widget> content = [];

    for (int i = 0; i < widget.texts.length; i++) {
      TextSelectableCustomCard card = TextSelectableCustomCard(
        widget.texts[i],
        widget.fontSize,
        unselectable: false,
        width: widget.cardWidthFactor * _SCREENWIDTH,
        onChanged: (bool selected) {
          onChanged(selected, i);
        },
        selected: _selected.contains(widget.texts.elementAt(i)),
      );

      //use user defined method to build if it was defined
      if (widget.itemBuilder != null)
        content.add(widget.itemBuilder(card, i));
      else {
        //otherwise, use predefined method of building
        //vertical orientation means Column with Row inside
        if (widget.orientation == GroupedCardOrientation.VERTICAL) {
          content.add(Row(children: <Widget>[
            Padding(
              padding: widget.innerSpacing,
            ), //TODO: ABSTAND ERSETZEN
            card,
          ]));
        } else {
          //horizontal orientation means Row with Column inside
          content.add(Column(children: <Widget>[
            Padding(
              padding: widget.innerSpacing,
            ), //TODO: ABSTAND ERSETZEN
            card,
          ]));
        }
      }
    }

    bool vertical = widget.orientation == GroupedCardOrientation.VERTICAL;
    return Container(
      padding: widget.padding,
      margin: widget.margin,
      child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: widget.crossAxisCount,
          scrollDirection: vertical ? Axis.vertical : Axis.horizontal,
          children: List.generate(widget.texts.length, (index) {
            return content[index];
          })),
    );
  }

  void onChanged(bool isChecked, int i) {
    bool isAlreadyContained = _selected.contains(widget.texts.elementAt(i));

    if (mounted) {
      setState(() {
        _selected.clear();
        if (!isChecked && isAlreadyContained) {
          _selected.remove(widget.texts.elementAt(i));
        } else if (isChecked && !isAlreadyContained) {
          _selected.add(widget.texts.elementAt(i));
        }

        if (widget.onChange != null)
          widget.onChange(isChecked, widget.texts.elementAt(i), i);
        if (widget.onSelected != null) widget.onSelected(_selected);
      });
    }
  }
}
