import 'package:flutter/material.dart';

void main() {
  runApp(OtherPage());
}

class OtherPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text('Other Page')),
          body: Center(
              child: RaisedButton(
                  child: Text('Back to Home Page'),
                  onPressed: () {
                    Navigator.pop(context);
                  })),
        ));
  }
}
