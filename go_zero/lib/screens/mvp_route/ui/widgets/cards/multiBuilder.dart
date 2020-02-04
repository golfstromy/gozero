import 'package:flutter/material.dart';

import 'customCard.dart';
import 'wideCard.dart';

const double _GAPBETWEENCARDSFACTOR = 16 / 667;

Widget getSelectableCards(List<String> texts,
    [List<Widget> images, String type = "wide"]) {
  List<WideSelectionCard> cards = [];
  List<Widget> children = [];

  if (type == "wide") {
    if (texts.length == images.length) {
      for (int i = 0; i < texts.length; i++) {
        cards.add(
          WideSelectionCard(
            text: texts[i],
            image: images[i],
          ),
        );
      }
    }
  }

  for (int n = 0; n < cards.length; n++) {
    children.add(Padding(
        padding: EdgeInsets.only(top: n != 0 ? _GAPBETWEENCARDSFACTOR : 0),
        child: cards[n]));
  }

  /*children.add(FlatButton(
    child: Text("Test"),
    onPressed: () {cards[1].setSelected(false)},
  ));*/

  return Column(
    children: children,
  );
}

List<bool> getSelectCardsValue(List<CustomCard> cards) {
  List<bool> cardValues = [];
  for (CustomCard card in cards) {
    cardValues.add(card.getSelected());
  }
}
