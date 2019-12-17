
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GMap extends StatefulWidget {
  GMapState _state;

  double length;

  GMap({this.length});

  @override
  State<GMap> createState() {
    _state = GMapState();
    return _state;
  }

  Future<LatLng> getCurrentLocation() async {
    return _state.getCurrentLocation();
  }
}

class GMapState extends State<GMap> {
  var _location = new Location();
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  static final CameraPosition _kUOC = CameraPosition(
    target: LatLng(41.406578, 2.194420),
    zoom: 14.4746,
  );

  GoogleMap _gMap;

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        switch (defaultTargetPlatform) {
          case TargetPlatform.iOS:
            return CupertinoAlertDialog(
              title: new Text("Alert Dialog title"),
              content: new Text("Alert Dialog body"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          case TargetPlatform.android:
          default:
          // return object of type Dialog
            return AlertDialog(
              title: new Text("Alert Dialog title"),
              content: new Text("Alert Dialog body"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
        }
      },
    );
  }

  void _addMarker(LatLng loc) {
    // creating a new MARKER
    final Marker marker = Marker(
      position: loc,
      markerId: MarkerId('currentLoc'),
      onTap: () {},
    );

    setState(() {
      // adding a new marker to map
      _markers.remove(_markers);
      _markers.add(marker);
    });
  }

  Future<LatLng> getCurrentLocation() async {
    final controller = await _controller.future;
    LatLng res = null;
    try {
      var currentLocation = await _location.getLocation();
      res = LatLng(currentLocation.latitude, currentLocation.longitude);

      controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: res, zoom: 19)));
      _addMarker(res);
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        _showDialog();
      }
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    _gMap = GoogleMap(
      mapType: MapType.normal,
      padding: EdgeInsets.fromLTRB(0, 0, this.widget.length * 0.3, 0),
      compassEnabled: false,
      myLocationEnabled: false,
      zoomGesturesEnabled: false,
      myLocationButtonEnabled: false,
      initialCameraPosition: _kUOC,
      markers: _markers,
      onMapCreated: (GoogleMapController controller) async {
        _controller.complete(controller);
        await getCurrentLocation();
      },
    );
    return new Scaffold(body: _gMap);
  }
}
