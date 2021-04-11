import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_quotes/bloc/quote_bloc.dart';
import 'package:random_quotes/model/quote.model.dart';
import 'package:random_quotes/ui/components/quote_card.dart';
import 'package:random_quotes/utils/constants/color_schema.dart';

class QuoteHomeScreen extends StatefulWidget {
  @override
  _QuoteHomeScreenState createState() => _QuoteHomeScreenState();
}

class _QuoteHomeScreenState extends State<QuoteHomeScreen> {
  int noOfQuote = 0;
  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.height;
    quoteBloc.fetchQuotes();
    return StreamBuilder(
      stream: quoteBloc.quote,
      builder: (context, AsyncSnapshot<List<Quotes>> snapshot) {
        if (snapshot.hasData) {
          return _buildQuoteScreen(snapshot.data, screenSize,noOfQuote);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return SafeArea(child:Container(child: CircularProgressIndicator(),color: backgroundColor,alignment: Alignment.center,));
      },
    );
  }

  SafeArea _buildQuoteScreen(List<Quotes> data, double screenSize,quoteNo) {
    return SafeArea(
      child: Container(
          color: backgroundColor,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(
                height: screenSize * (1 / 9),
              ),
              QuoteCard(400, data[quoteNo].text, data[quoteNo].author),
              SizedBox(
                height: screenSize * (1 / 6),
              ),
              FloatingActionButton(
                backgroundColor: cardColor,
                  child: Icon(Icons.bolt),
                  onPressed: () {
                    var rng = new Random();
                    setState(() {
                      noOfQuote = rng.nextInt(20) ;
                    });
                  })
            ],
          )),
    );
  }
}
