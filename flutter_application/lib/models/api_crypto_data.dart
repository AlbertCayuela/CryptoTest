import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application/models/cryptocurrency.dart';
import 'package:http/http.dart' as http;

class APICryptoData {
  List<CryptoCurrency> cryptocurrencies = [];

  //list of the ids of the cryptos we want to show
  List<int> wantedCryptocurrencies = [1, 1027, 825, 5426, 6636, 74, 5994];

  String _apiUrl =
      "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest";

  Future<List<CryptoCurrency>> getData() async {
    List<CryptoCurrency> cryptocurrencies = [];

    http.Response response = await http.get(Uri.parse(_apiUrl),
        headers: {"X-CMC_PRO_API_KEY": "b356b6c0-4c9a-4de0-ba3b-2f718bb1698d"});

    Map<String, dynamic> cryptoMap = jsonDecode(response.body);

    //log(cryptoMap['data'][0]['quote']['USD']['price'].toString());

    //log(dataMap.toString());

    this.cryptocurrencies = cryptocurrencies;

    return cryptocurrencies;
  }
}
