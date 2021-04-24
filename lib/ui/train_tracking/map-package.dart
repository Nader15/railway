import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTest1 extends StatefulWidget {
  @override
  _MapTest1State createState() => _MapTest1State();
}

class _MapTest1State extends State<MapTest1> {
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  GoogleMapController controller;

  List<LatLng> latlngSegment1 = List();
  List<LatLng> latlngSegment2 = List();
  static LatLng _lat1 = LatLng(13.035606, 77.562381);
  static LatLng _lat2 = LatLng(13.070632, 77.693071);
  static LatLng _lat3 = LatLng(12.970387, 77.693621);
  static LatLng _lat4 = LatLng(12.858433, 77.575691);
  static LatLng _lat5 = LatLng(12.948029, 77.472936);
  static LatLng _lat6 = LatLng(13.069280, 77.455844);
  LatLng _lastMapPosition = _lat1;

  @override
  void initState() {
    super.initState();
    //line segment 1
    latlngSegment1.add(_lat1);
    latlngSegment1.add(_lat2);
    latlngSegment1.add(_lat3);
    latlngSegment1.add(_lat4);

    //line segment 2
    latlngSegment2.add(_lat4);
    latlngSegment2.add(_lat5);
    latlngSegment2.add(_lat6);
    latlngSegment2.add(_lat1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        //that needs a list<Polyline>
        polylines: _polyline,
        markers: _markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _lastMapPosition,
          zoom: 11.0,
        ),
        mapType: MapType.normal,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controllerParam) {
    setState(() {
      controller = controllerParam;
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        //_lastMapPosition is any coordinate which should be your default
        //position when map opens up
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Awesome Polyline tutorial',
          snippet: 'This is a snippet',
        ),
      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('line1'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment1,
        width: 2,
        color: Colors.blue,
      ));

      //different sections of polyline can have different colors
      _polyline.add(Polyline(
        polylineId: PolylineId('line2'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment2,
        width: 2,
        color: Colors.red,
      ));
    });
  }
}