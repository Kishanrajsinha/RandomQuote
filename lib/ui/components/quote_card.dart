import 'package:flutter/material.dart';
import 'package:random_quotes/utils/constants/color_schema.dart';
import 'package:random_quotes/utils/styles/font_style.dart';

class QuoteCard extends StatelessWidget {
  //Creating Constructor for variable
  QuoteCard(this.cardWidth, this.quoteText, this.authorText);
  final double cardWidth;
  final String quoteText;
  final String authorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: backgroundColor1),
        ],
      ),
      width: cardWidth,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: cardWidth - 10,
              padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
              alignment: Alignment.center,
              child: Text(
                '$quoteText',
                style: TextThemes.quoteText,
                maxLines: 5,
                textAlign: TextAlign.center,
              )),
          SizedBox(
            height: 50,
          ),
          Container(
              alignment: Alignment.topCenter,
              child: Text(
                '$authorText',
                style: TextThemes.authorText,
              ))
        ],
      ),
    );
  }
}
