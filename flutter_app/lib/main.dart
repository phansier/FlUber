import 'package:flutter/material.dart';
import 'package:flutter_app/fluber_login_screen.dart';
import 'package:flutter_app/main_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Fluber',
    theme: new ThemeData(
      primaryColor: Color(0xffBB6BD9),
    ),
    home: FluberLoginScreen(),
  ));
}
