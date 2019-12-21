import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:on_time_app/utils/widgets.dart';

class GMap extends StatefulWidget {
  final double length;

  GMap({Key key, this.length}) : super(key: key);

  @override
  State<GMap> createState() => GMapState(this.length);
}

class GMapState extends State<GMap> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};

  CameraPosition _kUOC;
  LatLng latLng;
  double length;
  GoogleMap _gMap;

  GMapState(this.length) {
    latLng = LatLng(41.406578, 2.194420);
    _kUOC = CameraPosition(
      target: latLng,
      zoom: 14.4746,
    );
  }

  void _addMarker(LatLng loc) {
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
    var _location = Location();
    LatLng res;
    try {
      var currentLocation = await _location.getLocation();
      res = LatLng(currentLocation.latitude, currentLocation.longitude);

      controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: res, zoom: 19)));
      _addMarker(res);
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        DialogManager.showException(
            context, 'App does not have permission to use location');
      }
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    _gMap = GoogleMap(
      mapType: MapType.normal,
      padding: EdgeInsets.fromLTRB(0, 0, this.length * 0.3, 0),
      compassEnabled: false,
      myLocationEnabled: false,
      zoomGesturesEnabled: false,
      myLocationButtonEnabled: false,
      initialCameraPosition: _kUOC,
      markers: _markers,
      onMapCreated: (GoogleMapController controller) async {
        _controller.complete(controller);
        controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: latLng, zoom: 19)));
        await getCurrentLocation();
      },
    );
    return new Scaffold(body: _gMap);
  }
}
