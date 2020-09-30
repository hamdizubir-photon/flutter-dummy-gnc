import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/homePage.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(LoginPage());
  });
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

RegExp emailRegx = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
    caseSensitive: false);

RegExp pwdRegx =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{12,}$');

final _formKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  int number = 0;

  void pressButton() {
    setState(() {
      number = number + 1;
    });
  }

  TextEditingController emailController = TextEditingController();

  TextEditingController pwdController = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(40, 20, 40, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                    margin: EdgeInsets.only(top: 15, bottom: 15),
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    width: 500,
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 2.0, color: Colors.grey[200]),
                    )),
                    child: Image(
                        image: AssetImage('assets/primary-logo.png'),
                        width: 150,
                        height: 50)),
              ),
              Container(
                // color: Colors.yellow,
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("Returning customers",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w700)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("*required",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Text(
                          "If you are a registered user, please enter your email and password.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: TextFormField(
                                maxLength: 256,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    hintText: 'Email address*',
                                    hintStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: emailController,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please enter email';
                                  } else if (!(emailRegx.hasMatch(value))) {
                                    return 'Enter valid email';
                                  }
                                  return null;
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: TextFormField(
                                maxLength: 12,
                                decoration: InputDecoration(
                                    hintText: 'Password*',
                                    hintStyle: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                obscureText: true,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: pwdController,
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please enter password';
                                  } else if (!(pwdRegx.hasMatch(value))) {
                                    return 'Enter valid password';
                                  }
                                  return null;
                                }),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              color: Colors.red,
                              padding: EdgeInsets.fromLTRB(62.5, 15, 62.5, 15),
                              child: Text('LOGIN',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white)),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return HomePage();
                                  }));
                                  return false;
                                }
                              }),
                          FlatButton(
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }));
                              },
                              padding: EdgeInsets.all(0),
                              child: Text('I forgot my password',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.cyan[700]))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("New customers",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w700)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, right: 20.0),
                      child: Text(
                          "Creating an account is easy. Just fill out the form below and enjoy the benefits of being a registered customer.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40.0),
                      child: OutlineButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return HomePage();
                            }));
                          },
                          borderSide: BorderSide(color: Colors.red),
                          padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Text('CREATE ACCOUNT',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.pink,
                                  fontWeight: FontWeight.w700))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Text("Benefits of Creating an Account",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("News and exclusive offers!",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0, right: 20.0),
                      child: Text(
                          "Sign up to receive email updates on special promotions, new product announcements, gift ideas and more.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("Order History",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0, right: 20.0),
                      child: Text(
                          "Receive important information about your order. You can even track it up to the minute it arrives.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("Faster Checkout",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0, right: 20.0),
                      child: Text(
                          "Save your billing and shipping information to make it easier to buy your favorite gear.",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
