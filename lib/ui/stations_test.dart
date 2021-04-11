import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:railway/ApiFunctions/Api.dart';
import 'dart:convert';
import 'dart:io';

import 'package:railway/models/stations.dart';
import 'package:railway/utils/colors_file.dart';


class StationsTest extends StatefulWidget {
  @override
  _StationsTestState createState() => _StationsTestState();
}

class _StationsTestState extends State<StationsTest> {
  StationsModel stationsModel;
  List<Success> stationsList = List();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 0), () {
      gettingData();
    });
//    showHud();
  }

  gettingData() {
    setState(() {
      Api(context).stationApi(_scaffoldKey).then((value) {
        stationsModel = value;
        stationsModel.success.forEach((element) {
          setState(() {
            stationsList.add(element);
          });
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Main Station',style: TextStyle(color: primaryAppColor),),
        centerTitle: true,
        backgroundColor: blueAppColor,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: primaryAppColor,),
        ),
      ),
      body: Center(
        child: Container(
          child:ListView.builder(
            itemCount: stationsList.length,
            itemBuilder: (context,index){
              return  ListTile(
                leading:  Icon(Icons.location_on,color: Colors.blue,),
                title: Text(
                  "${stationsList[index].name}",
                  style: TextStyle(color: blueAppColor, fontSize: 20,),
                ),
              );
            },
          )
        ),
      ),
    );
  }
}
