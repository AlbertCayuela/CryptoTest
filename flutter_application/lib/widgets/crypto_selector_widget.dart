import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/models/cryptocurrency.dart';
import 'package:flutter_application/providers/app_provider.dart';
import 'package:flutter_application/enums.dart';
import 'package:flutter_application/widgets/selectable_crypto_widget.dart';
import 'package:provider/src/provider.dart';

class CryptoSelectorWidget extends StatefulWidget {
  Color backgroundColor;
  List<CryptoCurrency> cryptocurrencies;

  CryptoSelectorWidget(
      {required this.backgroundColor, required this.cryptocurrencies, Key? key})
      : super(key: key);

  @override
  State<CryptoSelectorWidget> createState() => _CryptoSelectorWidgetState();
}

class _CryptoSelectorWidgetState extends State<CryptoSelectorWidget> {
  late AppState appState;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    appState = context.watch<AppProvider>().appState;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [widget.backgroundColor, Color(0xFF151A20)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0, 0.3],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(constPadding),
            child: SafeArea(
              child: Column(children: [
                Text(
                    'Choose two cryptocurrencies in which you would invest your money:',
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.headline3),
                for (var i in widget.cryptocurrencies)
                  SelectableCryptoWidget(
                    name: i.name,
                    usdPrice: i.usdPrice,
                    cryptoType: i.cryptoType,
                    slug: i.slug,
                  ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/third_screen',
                      arguments: appState),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF00B4D8))),
                  child: Text(
                    'See results',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
