import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/providers/app_provider.dart';
import 'package:flutter_application/widgets/crypto_selector_widget.dart';
import 'package:provider/src/provider.dart';

import '../state.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({Key? key}) : super(key: key);

  late AppState appState;

  @override
  Widget build(BuildContext context) {
    //watch appstate from app provider
    appState = context.watch<AppProvider>().appState;
    switch (appState) {
      case AppState.none:
        return CryptoSelectorWidget(backgroundColor: Color(darkGrayColor));
      case AppState.good:
        return CryptoSelectorWidget(backgroundColor: Colors.green);
      case AppState.average:
        return CryptoSelectorWidget(backgroundColor: Colors.orangeAccent);
      case AppState.bad:
        return CryptoSelectorWidget(backgroundColor: Colors.redAccent);
    }
  }
}
