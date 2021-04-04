import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:railway/utils/colors_file.dart';


class TrainTracking extends StatefulWidget {
  @override
  _TrainTrackingState createState() => _TrainTrackingState();
}

class _TrainTrackingState extends State<TrainTracking> {
  int _currentStep = 0;

  double index = 0;

  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) {
      setState(() {
        index += 5;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  gettingData() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryAppColor,
        appBar: AppBar(
            leading: Container(),
            backgroundColor: primaryAppColor,
            bottom: PreferredSize(
              preferredSize: Size.square(20),
              child: Container(
                padding: EdgeInsets.only(bottom: 20),
                // height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 30, left: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Train Tracking",
                            style: TextStyle(
                              color: blackColor,
                              fontSize: 25,
                            ),
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 30, left: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset(
                          "images/train.svg",
                          color: Colors.black,
                          width: 12,
                          height: 35,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 20,
                    // ),
                  ],
                ),
              ),
            )),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Row(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            step("Cairo Station"),
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              width: 2,
                              height: 300,
                              color: blackColor,
                            ),
                            step("Aswan Station"),
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              width: 2,
                              height: 300,
                              color: blackColor,
                            ),
                            step("Banha Station"),
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              width: 2,
                              height: 300,
                              color: blackColor,
                            ),
                            step("Zagazig Station"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.66,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: index),
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                padding: EdgeInsets.all(10),
                                height: 100,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: blackColor,
                                  // shape: BoxShape.circle,
                                ),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      "images/train.svg",
                                      fit: BoxFit.cover,
                                      width: 20,
                                      height: 30,
                                      color: primaryAppColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget step(String title) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.all(7),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: blackColor,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              "images/train.svg",
              fit: BoxFit.cover,
              width: 10,
              height: 10,
              color: primaryAppColor,
            ),
          ),
          Container(
              child: Text(
            title,
            style: TextStyle(fontSize: 13),
            textAlign: TextAlign.start,
          ))
        ],
      ),
    );
  }
}
