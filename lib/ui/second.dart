import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railway/ui/OnBoarding.dart';
import 'package:railway/utils/colors_file.dart';
import 'package:railway/utils/custom_widgets/backgrount.dart';
import 'package:railway/utils/navigator.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Background(),
        Stack(
          children: <Widget>[
            SafeArea(
              child: Container(
                alignment: Alignment.center,
                height: 80,
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 15,),
                child: Column(
                  children: <Widget>[
                    Text('Welcome to our Railway Application',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Find your train anytime',
                        style: TextStyle(
                            color: Colors.white.withAlpha(240),
                            fontSize: 20,
                            fontWeight: FontWeight.w300)),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: 0, top: MediaQuery.of(context).size.height / 1.15),
                child: RaisedButton(
                  color: blueAppColor,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 3,
                    right: MediaQuery.of(context).size.width / 3,
                    top: 10,
                    bottom: 10,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    navigateAndKeepStack(context, OnBoarding());
                  },
                  child: Text(
                    "Get Started",
                    style: TextStyle(fontSize: 20,color: primaryAppColor),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
