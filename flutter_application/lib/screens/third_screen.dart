import 'package:flutter/material.dart';
import 'package:flutter_application/providers/app_provider.dart';
import 'package:flutter_application/enums.dart';
import 'package:flutter_application/widgets/results_widget.dart';
import 'package:provider/src/provider.dart';

import '../constants.dart';

class ThirdScreen extends StatelessWidget {
  late AppState appState;

  ThirdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    appState = context.watch<AppProvider>().appState;
    switch (appState) {
      case AppState.none:
        return ResultsWidget(
            backgroundColor: Color(darkGrayColor),
            level: 'fearful',
            descriptionStr:
                'You are a disappointment for the crypto world! If you are afraid of this market you should not invest again.');
      case AppState.good:
        return ResultsWidget(
            backgroundColor: Colors.green,
            level: 'good',
            descriptionStr:
                'You are an excellent investor! Your desicions will make you success in your life, see you on the moon.');
      case AppState.average:
        return ResultsWidget(
            backgroundColor: Colors.orangeAccent,
            level: 'normal',
            descriptionStr:
                'You are an average investor, keep studying about the market and you will end up being a good one.');
      case AppState.bad:
        return ResultsWidget(
          backgroundColor: Colors.redAccent,
          level: 'bad',
          descriptionStr:
              'You are a bad investor, if you want to make easy money go to a casino, this is not made for you.',
        );
    }
  }
}
