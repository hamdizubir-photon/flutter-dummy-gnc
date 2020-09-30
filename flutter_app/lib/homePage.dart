import 'package:flutter/material.dart';
import 'package:flutter_app/otherPage.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text('Home Page')),
          body: Center(
              child: RaisedButton(
                  child: Text('Go to Other Page'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return OtherPage();
                    }));
                  })),
        ));
  }
}
