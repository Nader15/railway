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
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Container(),
          backgroundColor: primaryAppColor,
          bottom: PreferredSize(
            preferredSize: Size.square(20),
            child: Container(
              // height: 200,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 30, left: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Main Stations",
                          style: TextStyle(
                              color: blackColor,
                              fontSize: 25,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )),
      body: Center(
        child: Container(
          child:ListView.builder(
            itemCount: stationsList.length,
            itemBuilder: (context,index){
              return  ListTile(
                leading:  Icon(Icons.location_on,color: Colors.blue,),
                title: Text(
                  "${stationsList[index].name}",
                  style: TextStyle(color: blackColor, fontSize: 20,),
                ),
              );
            },
          )
        ),
      ),
    );
  }
}
