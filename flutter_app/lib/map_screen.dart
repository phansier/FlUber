import 'package:flutter/material.dart';
import 'package:flutter_app/view/app_drawer.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  MapController mapController;
  var markers = List<Marker>();

  void initState() {
    super.initState();
    mapController = new MapController();
    markers.add(new Marker(
      width: 80.0,
      height: 80.0,
      point: new LatLng(55.66722, 37.282825),
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
      appBar: AppBar(title: Text('Chat')),
      body: _buildMap(context, widget),
      drawer: AppDrawer.buildDrawer(context, "chat"),
    );
  }

  Widget _buildMap(BuildContext context, MapScreen chatScreen) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: new FlutterMap(
              mapController: mapController,
              options: new MapOptions(
                center: new LatLng(55.66722, 37.282825),
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
            ),
          ),
          RaisedButton(
            onPressed: () {
              _changeMap();
            },
          ),
        ]);
  }

  void _changeMap() {
    setState(() {
      markers.clear();
      markers.add(new Marker(
        width: 80.0,
        height: 80.0,
        point: new LatLng(55.812863, 37.787677),
        builder: (ctx) => new Container(
              child: new Icon(
                Icons.local_florist,
                size: 80.0,
                color: Color(0xffBB6BD9),
              ),
            ),
      ));

      mapController.move(new LatLng(55.812863, 37.787677), 16.0);
    });
  }
}
