import 'package:flutter/material.dart';

class ResultsWidget extends StatelessWidget {
  final level;
  final descriptionStr;
  final backgroundColor;

  const ResultsWidget(
      {required this.backgroundColor,
      required this.level,
      required this.descriptionStr,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [backgroundColor, Color(0xFF151A20)],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        stops: [0, 0.3],
      )),
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent),
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Spacer(),
            Text(
              'You are a $level investor!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: 30),
            Text(
              descriptionStr,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
