import 'package:flutter/material.dart';
import 'package:railway/utils/colors_file.dart';

Container onBoarding2(){
  return Container(
    child: Column(
      children: [
        Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("images/onBoarding2.png",height: 200,color: blueAppColor,),
                Icon(Icons.train,color: primaryAppColor,size: 100,)
              ],
            ),
        ),
        SizedBox(height: 36.8),
        Container(
          padding: EdgeInsets.only(left: 0, right: 0),
          child: Column(
            children: [
              Text(
                "Browse Available Trips",
                style: TextStyle(color: whiteColor, fontSize: 25),
              ),
              SizedBox(height: 17),
              Text(
                "You can search for your destination or a trip and view trips details easily .",
                textAlign: TextAlign.center,
                style: TextStyle(color: whiteColor, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}