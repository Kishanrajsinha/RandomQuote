import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:random_quotes/model/quote.model.dart';

class ApiProvider {
  Client client = Client();
  final _baseUrl = "https://type.fit/api/quotes";

  Future<Quote> fetchQuotes() async{
    final response = await client.get("$_baseUrl");
    print(response.body.toString());

    if(response.statusCode == 200){
      return Quote.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to Load Quote');
    }
  }

}