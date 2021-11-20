import 'package:flutter/material.dart';
import 'package:flutter_application/providers/app_provider.dart';
import 'package:flutter_application/screens/second_screen.dart';
import 'package:flutter_application/screens/first_screen.dart';
import 'package:flutter_application/screens/third_screen.dart';
import 'package:flutter_application/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Invest it now',
        theme: lightThemeData,
        routes: {
          '/first_screen': (context) => FirstScreen(),
          '/second_screen': (context) => SecondScreen(),
          '/third_screen': (context) => ThirdScreen(),
        },
        initialRoute: '/first_screen',
        home: FirstScreen(),
      ),
    );
  }
}
