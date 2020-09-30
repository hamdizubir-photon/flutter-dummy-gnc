import 'package:flutter/material.dart';
import 'package:flutter_app/loginPage.dart';

void main() {
  runApp(MyApps());
}

class MyApps extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
