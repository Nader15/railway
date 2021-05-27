import 'package:flutter/material.dart';
import 'package:railway/models/trips_model.dart';
import 'package:railway/ui/train_tracking/StationsRoute/data.dart';

class Constants {
  static Color lightPrimary = Color(0xfff2f3f7);
  static Color lightAccent = Colors.blue;
  static Color lightBG = Color(0xfff2f3f7);

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor: lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
  );
}



///Change Text, Icon & Image accordingly to get desired result
class TripStations extends StatefulWidget {
  final Success success;

  const TripStations({Key key, this.success}) : super(key: key);
  @override
  _TripStationsState createState() => _TripStationsState();
}

class _TripStationsState extends State<TripStations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: <Widget>[
                    ///AppBar Text
                    Text(
                      "${widget.success.baseStation.name} ➞ ${widget.success.destinationStation.name}",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 220.0,
                      width: 350.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          ///Image address
                          image: AssetImage("images/railway_map.png"),
                          fit: BoxFit.fill,
                        ),
                        border: Border.all(width: 0.8),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Timeline(
                  ///Both data needs to be provided every time. If you don't want to add detail then use single colons('')
                  children: <Widget>[
                    MapTextData(
                        mainAddress: 'Cairo',
                        detailAddress: 'Ramses Square , Cairo'),
                    MapTextData(
                        mainAddress: 'Alex',
                        detailAddress: 'Alexandria Station'),
                    MapTextData(
                        mainAddress: 'banha',
                        detailAddress: 'قسم بنها، بنها، القليوبية'),
                    MapTextData(
                        mainAddress: 'Tanta',
                        detailAddress: 'طنطا (قسم 2)، طنطا، الغربية'), MapTextData(
                        mainAddress: 'Damanhour',
                        detailAddress: 'Damanhour Station'),
                  ],
                  indicators: <Widget>[
                    ///Add Icons here in ascending order
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_transit),
                    Icon(Icons.directions_transit),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}