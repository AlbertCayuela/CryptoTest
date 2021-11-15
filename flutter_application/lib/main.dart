import 'package:flutter/material.dart';
import 'package:flutter_application/screens/authentication/sign_in_screen.dart';
import 'package:flutter_application/screens/crypto_selector_screen.dart';
import 'package:flutter_application/screens/first_screen.dart';
import 'package:flutter_application/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invest it now',
      theme: lightThemeData,
      routes: {
        '/first_screen': (context) => FirstScreen(),
        '/signin_screen': (context) => SignInScreen(),
        '/crypto_selector_screen': (context) => CryptoSelectorScreen(),
      },
      initialRoute: '/first_screen',
      home: FirstScreen(),
    );
  }
}
