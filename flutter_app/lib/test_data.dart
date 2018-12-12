import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/flowers_screen.dart';

bool isIOS(BuildContext context) {
  return Theme.of(context).platform == TargetPlatform.iOS;
}

String getCurrentUserEmail(BuildContext context) {
  return isIOS(context) ? "aarepina@edu.hse.ru" : "asberyukhov@edu.hse.ru";
}

String getCurrentUserName(BuildContext context) {
  return isIOS(context) ? "Anastasiya" : "Andrey";
}

String getCurrentUserUrl(BuildContext context) {
  return isIOS(context)
      ? "https://pp.userapi.com/c834104/v834104830/18cae1/C6WSpj18A2c.jpg?ava=1"
      : "https://pp.userapi.com/c846016/v846016393/a26f5/9wxPoUiW-Y0.jpg?ava=1";
}

List<Bouquet> getBouquets(){
  List<Bouquet> list = List();

  list.add(Bouquet(
    "Rolfes The Florist",
    "images/girl.png",
    "images/RolfesTheFlorist.jpg",
    "M - size bouquet",
    "\$70",
    new GeoPoint(55.8061, 37.5411),
  ));
  list.add(Bouquet(
    "mickeylines",
    "",
    "images/mickeylines.jpg",
    "L - size bouquet",
    "\$100",
    new GeoPoint(55.801047, 37.531607),
  ));
  list.add(Bouquet(
    "clang.art",
    "images/lake.jpg",
    "images/clang.art.jpg",
    "M - size bouquet",
    "\$70",
    new GeoPoint(55.805001, 37.516419),
  ));
  list.add(Bouquet(
    "Fortunato Calabro",
    "",
    "images/FortunatoCalabro.jpg",
    "M - size bouquet",
    "\$70",
    new GeoPoint(55.790108, 37.556832),
  ));
  list.add(Bouquet(
    "ueha nochi",
    "",
    "images/uehanochi.jpg",
    "M - size bouquet",
    "\$70",
    new GeoPoint(55.787110, 37.533744),
  ));
  list.add(Bouquet(
    "ABBAS KHORSHIDI",
    "images/girl.png",
    "images/ABBAS_KHORSHIDI.jpg",
    "M - size bouquet",
    "\$70",
    new GeoPoint(55.797400, 37.501144),
  ));
  list.add(Bouquet(
    "Zander",
    "",
    "images/Zander.jpg",
    "M - size bouquet",
    "\$70",
    new GeoPoint(55.815996, 37.525248),
  ));
  list.add(Bouquet(
    "Liz McKenzie",
    "",
    "images/LizMcKenzie.jpg",
    "M - size bouquet",
    "\$70",
    new GeoPoint(55.808146, 37.580065),
  ));
  list.add(Bouquet(
    "Rolfes The Florist",
    "",
    "images/RolfesTheFlorist2.jpg",
    "M - size bouquet",
    "\$70",
    new GeoPoint(55.778082, 37.583290),
  ));
  list.add(Bouquet(
    "gagandeep.kaur",
    "",
    "images/gagandeep.kaur.jpg",
    "M - size bouquet",
    "\$70",
    new GeoPoint(55.824275, 37.495594),
  ));
  return list;
}