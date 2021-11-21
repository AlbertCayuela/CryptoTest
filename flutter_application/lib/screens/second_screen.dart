import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/models/api_crypto_data.dart';
import 'package:flutter_application/models/cryptocurrency.dart';
import 'package:flutter_application/providers/app_provider.dart';
import 'package:flutter_application/widgets/crypto_selector_widget.dart';
import 'package:provider/src/provider.dart';

import '../enums.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);

  late AppState appState;

  APICryptoData apiCryptoData = new APICryptoData();

  @override
  Widget build(BuildContext context) {
    //watch appstate from app provider
    appState = context.watch<AppProvider>().appState;
    return FutureBuilder(
      future: apiCryptoData.getData(),
      builder: (context, cryptocurrencies) {
        if (cryptocurrencies.hasData) {
          switch (appState) {
            case AppState.none:
              return CryptoSelectorWidget(
                backgroundColor: Color(darkGrayColor),
                cryptocurrencies: cryptocurrencies.data as List<CryptoCurrency>,
              );
            case AppState.good:
              return CryptoSelectorWidget(
                  backgroundColor: Colors.green,
                  cryptocurrencies:
                      cryptocurrencies.data as List<CryptoCurrency>);
            case AppState.average:
              return CryptoSelectorWidget(
                  backgroundColor: Colors.orangeAccent,
                  cryptocurrencies:
                      cryptocurrencies.data as List<CryptoCurrency>);
            case AppState.bad:
              return CryptoSelectorWidget(
                  backgroundColor: Colors.redAccent,
                  cryptocurrencies:
                      cryptocurrencies.data as List<CryptoCurrency>);
          }
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
