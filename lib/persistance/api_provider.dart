import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:random_quotes/model/quote.model.dart';

class ApiProvider {
  Client client = Client();
  final _baseUrl = "https://type.fit/api/quotes";

  Future<List<Quotes>> fetchQuotes() async{
    final response = await client.get("$_baseUrl");
    print(response.body.toString());

    if(response.statusCode == 200){
      final List a = quotesFromJson(response.body.toString());
      return a;
    }else{
      throw Exception('Failed to Load Quote');
    }
  }

}