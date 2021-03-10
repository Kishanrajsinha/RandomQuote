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
  @override
  Widget build(BuildContext context) {
    quoteBloc.fetchQuotes();
    return StreamBuilder(
      stream: quoteBloc.quote,
      builder: (context, AsyncSnapshot<Quote> snapshot){
        if(snapshot.hasData){
          return _buildQuoteScreen(snapshot.data);
        }else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
  SafeArea _buildQuoteScreen(Quote data){
    return SafeArea(
      child: Container(
        color: backgroundColor,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: QuoteCard(400,data.text,data.author),
      ),
    );
  }
}
