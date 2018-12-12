import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/app_drawer.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'test_data.dart';

class FlowersScreen extends StatefulWidget {
  static List<Bouquet> list = getBouquets();
  FlowersScreenState fss;

  FlowersScreen() {
    /*Firestore.instance.collection('bouquet').snapshots().first.then((data) {
      list.clear();
      data.documents
          .forEach((doc) => list.add(Bouquet.fromSnapshot(doc)));
      if (fss!=null) fss.setState((){});
    });*/
    /*StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('bouquet').snapshots(),
        builder: (context, snapshot) {
          list.clear();
          list.addAll(snapshot.data.documents
              .map((data) => Bouquet.fromSnapshot(data)));
        }).build(context, currentSummary);*/
  }

  @override
  State<StatefulWidget> createState() {
    fss = new FlowersScreenState();
    return fss;
  }
}

TextStyle TitleTextStyle =
    TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400, letterSpacing: 0.15);
TextStyle SubheadTextStyle = TextStyle(fontSize: 16.0, letterSpacing: 0.15);

class FlowersScreenState extends State<FlowersScreen> {
  int i = 0;

  MapController mapController;
  var markers = List<Marker>();

  void initState() {
    super.initState();
    mapController = new MapController();
    markers.add(new Marker(
      width: 80.0,
      height: 80.0,
      point: new LatLng(FlowersScreen.list[0].geopoint.latitude,
          FlowersScreen.list[0].geopoint.longitude),
      builder: (ctx) => new Container(
            child: new Icon(
              Icons.local_florist,
              size: 80.0,
              color: Color(0xffBB6BD9),
            ),
          ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main screen")),
      drawer: AppDrawer.buildDrawer(context, "home"),
      body: _columnFromBouquet(FlowersScreen.list),
    );
  }

  Widget _columnFromBouquet(List<Bouquet> bouquets) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_left,
                ),
                onPressed: (i > 0)
                    ? () {
                        i = i - 1;
                        _changeMap(new LatLng(bouquets[i].geopoint.latitude,
                            bouquets[i].geopoint.longitude));
                        setState(() {});
                      }
                    : null,
                iconSize: 40.0,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: _buildCard(context, bouquets),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_right,
                ),
                onPressed: (i < bouquets.length - 1)
                    ? () {
                        i = i + 1;
                        _changeMap(new LatLng(bouquets[i].geopoint.latitude,
                            bouquets[i].geopoint.longitude));
                        setState(() {});
                      }
                    : null,
                iconSize: 40.0,
              ),
            ],
          ),
        ),
        Flexible(
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: <Widget>[
              _buildMap(context),
              Positioned(
                bottom: 8.0,
                child: _createButton(context),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _createButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: () {},
        child: Text('Order'),
      ),
    );
  }

  Widget _buildCard(BuildContext context, List<Bouquet> bouquets) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            alignment: AlignmentDirectional.centerStart,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
              child: InputChip(
                avatar: bouquets[i].floristImagePath == ""
                    ? CircleAvatar(
                        child: Text(bouquets[i].floristName.substring(0, 2)),
                      )
                    : CircleAvatar(
                        backgroundImage:
                            AssetImage(bouquets[i].floristImagePath),
                      ),
                label: Text(bouquets[i].floristName),
                isEnabled: true,
                onPressed: () {},
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(bouquets[i].imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
            child: Text(
              bouquets[i].description,
              style: SubheadTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
            child: Text(
              bouquets[i].price,
              style: TitleTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMap(BuildContext context) {
    return new FlutterMap(
      mapController: mapController,
      options: new MapOptions(
        center: new LatLng(FlowersScreen.list[0].geopoint.latitude,
            FlowersScreen.list[0].geopoint.longitude),
        zoom: 16.0,
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken':
                'pk.eyJ1IjoicGhhbnNpZXIiLCJhIjoiY2puaHQ2cXJ6MGRkejNrdGE4dmc3MHJubyJ9.9DgkDtP5PL3iMMEZCgkvlQ',
            'id': 'mapbox.streets',
          },
        ),
        new MarkerLayerOptions(
          markers: markers,
        ),
      ],
    );
  }

  void _changeMap(LatLng latlng) {
    setState(() {
      markers.clear();
      markers.add(new Marker(
        width: 80.0,
        height: 80.0,
        point: latlng,
        builder: (ctx) => new Container(
              child: new Icon(
                Icons.local_florist,
                size: 80.0,
                color: Color(0xffBB6BD9),
              ),
            ),
      ));

      mapController.move(latlng, 16.0);
    });
  }
}

class Bouquet {
  String floristName;
  String floristImagePath;
  String imagePath;
  String description;
  String price;
  GeoPoint geopoint;
  DocumentReference reference;

  Bouquet(this.floristName, this.floristImagePath, this.imagePath,
      this.description, this.price, this.geopoint,
      {this.reference});

  Bouquet.fromMap(Map<Object, dynamic> map, {this.reference}) {
    assert(map['florist'] != null);
    assert(map['description'] != null);
    assert(map['price'] != null);
    assert(map['geopoint'] != null);
    DocumentReference postRef = Firestore.instance.document(map['florist']);

    Firestore.instance.runTransaction((Transaction tx) async {
      DocumentSnapshot postSnapshot = await tx.get(postRef);
      if (postSnapshot.exists) {
        this.floristName = postSnapshot.data['name'];
      }
    });

    this.imagePath = map['imagePath'];
    this.description = map['description'];
    this.price = map['price'];
    this.geopoint = map['geopoint'];
  }

  Bouquet.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
