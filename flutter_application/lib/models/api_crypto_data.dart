import 'dart:convert';
import 'dart:developer';

import 'package:flutter_application/enums.dart';
import 'package:flutter_application/models/cryptocurrency.dart';
import 'package:http/http.dart' as http;

class APICryptoData {
  List<CryptoCurrency> cryptocurrencies = [];

  //list of the ids of the cryptos we want to show
  List<int> wantedCryptocurrencies = [1, 1027, 825, 5426, 6636, 74, 5994];

  String _apiUrl =
      "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest";

  ///Gets data from coinmarketcap API and returns a list of desired cryptos
  Future<List<CryptoCurrency>> getData() async {
    List<CryptoCurrency> cryptocurrencies = [];

    http.Response response = await http.get(Uri.parse(_apiUrl),
        headers: {"X-CMC_PRO_API_KEY": "b356b6c0-4c9a-4de0-ba3b-2f718bb1698d"});

    //json in map format
    Map<String, dynamic> dataMap = jsonDecode(response.body);

    //accessing the data list inside the map and creating our cryptos
    for (var data in dataMap['data']) {
      if (wantedCryptocurrencies.contains(data['id'])) {
        CryptoType cryptoType;
        if (data['id'] == 1 ||
            data['id'] == 1027 ||
            data['id'] == 5426 ||
            data['id'] == 6636) {
          cryptoType = CryptoType.good;
        } else {
          cryptoType = CryptoType.bad;
        }

        cryptocurrencies.add(new CryptoCurrency(
            id: data['id'] as int,
            rank: data['cmc_rank'] as int,
            name: data['name'] as String,
            symbol: data['symbol'] as String,
            slug: data['slug'] as String,
            usdPrice: data['quote']['USD']['price'] as double,
            cryptoType: cryptoType));
      }
    }

    this.cryptocurrencies = cryptocurrencies;

    return cryptocurrencies;
  }
}
