import 'package:flutter/material.dart';
import 'package:go_zero/screens/mvp_route/ui/widgets/cards/wideCard.dart';

import 'groupedOrientations.dart';

class SelectableWideCardGroup extends StatefulWidget {
  ///Texts in the Card
  final List<String> texts;

  ///Images in the Card
  final List<Widget> images;

  ///Which cards are selected
  final List<String> checked;

  /// Called when the value of the SelectableWideCardGroup changes.
  final void Function(bool isChecked, String label, int index) onChange;

  /// Called when the user makes a selection.
  final void Function(List<String> selected) onSelected;

  /// The style to use for the texts.
  final TextStyle textStyle;

  /// Specifies the orientation to display elements.
  final GroupedCardOrientation orientation;

  /// Called when needed to build a SelectableWideCardGroup element.
  final Widget Function(WideSelectionCard card, int index) itemBuilder;

  /// If true the Card's value can be true, false, or null.
  final bool tristate;

  //SPACING STUFF
  final EdgeInsetsGeometry innerSpacing;
  /// Empty space in which to inset the SelectableWideCardGroup.
  final EdgeInsetsGeometry padding;

  /// Empty space surrounding the SelectableWideCardGroup.
  final EdgeInsetsGeometry margin;

  SelectableWideCardGroup({
    Key key,
    @required this.texts,
    @required this.images,
    this.checked,
    this.onChange,
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
  _SelectableWideCardGroupState createState() =>
      _SelectableWideCardGroupState();
}

class _SelectableWideCardGroupState extends State<SelectableWideCardGroup> {
  List<String> _selected = [];

  @override
  void initState() {
    super.initState();

    //set the selected to the checked (if not null)
    _selected = widget.checked ?? [];
  }

  @override
  Widget build(BuildContext context) {
    //set the selected to the checked (if not null)
    if (widget.checked != null) {
      _selected = [];
      _selected.addAll(widget.checked); //use add all to prevent a shallow copy
    }

    List<Widget> content = [];

    for (int i = 0; i < widget.texts.length; i++) {
      WideSelectionCard card = WideSelectionCard(
        selected: _selected.contains(widget.texts.elementAt(i)),
        image: widget.images[i],
        text: widget.texts[i],
      );

      //use user defined method to build
      if (widget.itemBuilder != null)
        content.add(widget.itemBuilder(card, i));
      else {
        //otherwise, use predefined method of building
        //vertical orientation means Column with Row inside
        if (widget.orientation == GroupedCardOrientation.VERTICAL) {
          content.add(Row(children: <Widget>[
            Padding(padding: widget.innerSpacing,), //TODO: ABSTAND ERSETZEN
            card,
          ]));
        } else {
          //horizontal orientation means Row with Column inside
          content.add(Column(children: <Widget>[
             Padding(padding: widget.innerSpacing,), //TODO: ABSTAND ERSETZEN
            card,
          ]));
        }
      }
    }

    return Container(
      padding: widget.padding,
      margin: widget.margin,
      child: widget.orientation == GroupedCardOrientation.VERTICAL
          ? Column(children: content)
          : Row(children: content),
    );
  }

  void onChanged(bool isChecked, int i) {
    bool isAlreadyContained = _selected.contains(widget.texts.elementAt(i));

    if (mounted) {
      setState(() {
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
