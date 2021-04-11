import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:random_quotes/model/quote.model.dart';
import 'package:random_quotes/persistance/repository.dart';


class QuoteBloc{
  Repository _repository = Repository();

  final _quoteFetcher = PublishSubject<List<Quotes>>();

  Observable<List<Quotes>> get quote => _quoteFetcher.stream;

  fetchQuotes() async {
    List<Quotes> quote = await _repository.fetchQuotes();
    _quoteFetcher.sink.add(quote);
  }
  dispose(){
    _quoteFetcher.close();
  }
}

final quoteBloc = QuoteBloc();