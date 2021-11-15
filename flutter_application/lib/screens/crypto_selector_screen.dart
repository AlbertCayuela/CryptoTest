import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';

class CryptoSelectorScreen extends StatelessWidget {
  const CryptoSelectorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(constPadding),
        child: SafeArea(
          child: Column(
            children: [
              Text(
                  'Choose two cryptocurrencies in which you would invest your money:',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.headline3),
            ],
          ),
        ),
      ),
    );
  }
}
