import 'package:flutter/material.dart';
import 'package:flutter_app/presenter/navigation.dart';
import 'test_data.dart';

class FluberLoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginState();
}

class LoginState extends State<FluberLoginScreen> {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 120.0, 24.0, 24.0),
      child: Center(
        child: Text(
          'Discover florists that deliver near you',
          style: TextStyle(
            fontSize: 36.0,
            color: Color(0xfffcfcfc),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    var emailText = new TextEditingController();
    Widget emailEditText = Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
      child: TextField(
        controller: emailText,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: 'Email',
        ),
      ),
    );
    var pwText = new TextEditingController();
    Widget passwordEditText = Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
      child: TextField(
        controller: pwText,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: 'Password',
        ),
        obscureText: true,
      ),
    );

    emailText.text = getCurrentUserEmail(context);
    pwText.text = "12345678";

    Widget loginButton = Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: () {
          _loggedIn();
        },
        child: Text('Login'),
      ),
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/girl.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.multiply)),
        ),
        child: ListView(children: <Widget>[
          titleSection,
          emailEditText,
          passwordEditText,
          loginButton
        ]),
      ),
    );
  }

  void _loggedIn() {
    Navigation.goToFlowersScreen(context);
  }
}
