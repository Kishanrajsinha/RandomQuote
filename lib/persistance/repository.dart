import 'package:random_quotes/model/quote.model.dart';
import 'api_provider.dart';

class Repository {
  ApiProvider appApiProvider = ApiProvider();
  Future<Quote> fetchQuotes() => appApiProvider.fetchQuotes();
}