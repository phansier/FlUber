import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/flowers_screen.dart';
import 'package:flutter_app/test_data.dart';
import 'package:flutter_app/view/app_drawer.dart';

class SellersScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SellersScreenState();
}

class SellersScreenState extends State<SellersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seller\'s screen')),
      body: _buildBody(context),
      drawer: AppDrawer.buildDrawer(context, "add_shopping_cart"),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
        child: Text(
          "2 booking requests",
          style: SubheadTextStyle,
        ),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
        child: Text(
          "1 booking has been cancelled",
          style: SubheadTextStyle,
        ),
      ),
      Flexible(
        fit: FlexFit.loose,
        child: GridView.count(
          crossAxisCount: 2,
          children:
              getBouquets().map((b) => _buildBouquetCard(context, b)).toList(),
        ),
      ),
      _createButton(context),
    ]);
  }

  Widget _createButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: () {},
        child: Text('Add new bouquet'),
      ),
    );
  }

  Widget _buildBouquetCard(BuildContext context, Bouquet bouquet) {
    return Card(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Flexible(
          fit: FlexFit.loose,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(bouquet.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
          child: Text(
            bouquet.description,
            style: SubheadTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
          child: Text(
            bouquet.price,
            style: TitleTextStyle,
          ),
        ),
      ],
    ));
  }
}
