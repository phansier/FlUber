import 'package:flutter/material.dart';
import 'package:flutter_app/view/chat_screen.dart';
import 'package:flutter_app/flowers_screen.dart';
import 'package:flutter_app/sellers_screen.dart';

class Navigation {
  static void goToSellersMode(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SellersScreen()));
  }

  static void goToChatMode(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ChatScreen()));
  }

  static void goToFlowersScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FlowersScreen()));
  }
}
