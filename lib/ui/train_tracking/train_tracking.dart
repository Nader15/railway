import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:railway/ui/train_tracking/model.dart';
import 'package:railway/utils/colors_file.dart';

class TrainTracking extends StatefulWidget {
  @override
  _TrainTrackingState createState() => _TrainTrackingState();
}

class _TrainTrackingState extends State<TrainTracking> {
  GoogleMapController mapController;

  Position _currentPosition;
  String _currentAddress;

  Set<Marker> allMarkers = {};

  PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  final Set<Polyline> _polyline = {};

  /////////////////////////////////////////////////////////////////////////

  GoogleMapController _mapController;

  PageController _pageController;

  int prevPage;

  static LatLng _lat1 = LatLng(30.781681, 30.994857);
  static LatLng _lat2 = LatLng(30.455546, 31.181067);
  static LatLng _lat3 = LatLng(30.062382, 31.246582);
  static LatLng _lat4 = LatLng(30.009264, 31.208038);
  static LatLng _lat5 = LatLng(26.551354, 31.699072);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    latlngSegment1.add(_lat1);
    latlngSegment1.add(_lat2);
    latlngSegment1.add(_lat3);
    latlngSegment1.add(_lat4);
    latlngSegment1.add(_lat5);
    _getCurrentLocation();
    coffeeShops.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.stationName),
          draggable: false,
          infoWindow:
              InfoWindow(title: element.stationName, snippet: element.address),
          position: element.locationCoords));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _coffeeShopList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
          onTap: () {
            // moveCamera();
          },
          child: Stack(children: [
            Center(
                child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    height: 125.0,
                    width: 275.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 10.0,
                          ),
                        ]),
                    child: SingleChildScrollView(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white),
                          child: Row(children: [
                            Container(
                                height: 90.0,
                                width: 90.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        topLeft: Radius.circular(10.0)),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            coffeeShops[index].thumbNail),
                                        fit: BoxFit.cover))),
                            SizedBox(width: 5.0),
                            Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    coffeeShops[index].stationName,
                                    style: TextStyle(
                                        fontSize: 12.5,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    coffeeShops[index].address,
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Container(
                                    width: 170.0,
                                    child: Text(
                                      coffeeShops[index].description,
                                      style: TextStyle(
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  )
                                ])
                          ])),
                    )))
          ])),
    );
  }

  //Initialize Geolocator and define a variable.
  final Geolocator _geolocator = Geolocator();

  // Method for retrieving the current location
  _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        // Store the position in the variable
        _currentPosition = position;

        print('CURRENT POS: $_currentPosition');
        // For moving the camera to current location
        _mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
    }).catchError((e) {
      print(e);
    });
  }

  // Method for retrieving the address

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: blueAppColor,
          onPressed: () {
            _mapController.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(
                    _currentPosition.latitude,
                    _currentPosition.longitude,
                  ),
                  zoom: 18.0,
                ),
              ),
            );
          },
          child: Icon(
            Icons.my_location,
            color: whiteColor,
          ),
        ),
        appBar: AppBar(
          backgroundColor: blueAppColor,
          title: Text('Stations & Train Tracking'),
          // centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                polylines: _polyline,
                initialCameraPosition: CameraPosition(
                    target: _lastMapPosition, zoom: 12.0),
                markers: Set.from(allMarkers),
                onMapCreated: _onMapCreated,
              ),
            ),
            Positioned(
              bottom: 20.0,
              child: Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: coffeeShops.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _coffeeShopList(index);
                  },
                ),
              ),
            )
          ],
        ));
  }

  // void mapCreated(controller) {
  //   setState(() {
  //     _mapController = controller;
  //   });
  // }
  LatLng _lastMapPosition = _lat1;
  List<LatLng> latlngSegment1 = List();

  void _onMapCreated(GoogleMapController controllerParam ) {
    setState(() {
      controllerParam = controllerParam;
      allMarkers.add(Marker(
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
     });
  }

  moveCamera() {
    _mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: coffeeShops[_pageController.page.toInt()].locationCoords,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }
}
