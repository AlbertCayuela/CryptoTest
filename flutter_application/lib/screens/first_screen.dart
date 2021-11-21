import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/providers/app_provider.dart';
import 'package:flutter_application/enums.dart';
import 'package:provider/src/provider.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Image.asset(
              'assets/trading_chart.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(constPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(),
                Text(
                  "CRYPTO TEST",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(color: Colors.white),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/btc_logo.png', height: 50),
                      Image.asset('assets/eth_logo.png', height: 50),
                      Image.asset('assets/sol_logo.png', height: 50),
                      Image.asset('assets/shib_logo.png', height: 50),
                    ],
                  ),
                ),
                Spacer(flex: 4),
                ElevatedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/second_screen').then((_) {
                    context.read<AppProvider>().appState = AppState.none;
                    context.read<AppProvider>().selectedItems = 0;
                  }),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF00B4D8)),
                  ),
                  child: Text(
                    'START',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
