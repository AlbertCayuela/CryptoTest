import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/constants.dart';
import 'package:flutter_application/themes.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(constPadding),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(flex: 2),
                Text(
                  'Sign in',
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(color: Colors.white),
                ),
                SizedBox(height: 20),
                TextFormField(
                  style: lightTextTheme.bodyText1,
                  decoration: InputDecoration(
                    label: Row(
                      children: [Text('Name')],
                    ),
                    labelStyle: lightTextTheme.bodyText1
                        ?.copyWith(color: Colors.white38),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white38),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                TextFormField(
                  style: lightTextTheme.bodyText1,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Row(
                      children: [Text('Password')],
                    ),
                    labelStyle: lightTextTheme.bodyText1
                        ?.copyWith(color: Colors.white38),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white38),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(
                      context, '/crypto_selector_screen', (route) => false),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF00B4D8)),
                  ),
                  child: Text(
                    'SIGN IN',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Spacer(flex: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
