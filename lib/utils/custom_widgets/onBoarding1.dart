import 'package:flutter/material.dart';
import 'package:railway/utils/colors_file.dart';

Container onBoarding1(){
  return Container(
    child: Column(
      children: [
        Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("images/loginOnBoard.png",height: 200,color: blueAppColor,),
                Icon(Icons.exit_to_app,color: primaryAppColor,size: 80,)
              ],
            ),
        ),
        SizedBox(height: 36.8),
        Container(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              Text(
                "Register Your Account",
                style: TextStyle(color: whiteColor, fontSize: 25),
              ),
              SizedBox(height: 17),
              Text(
                "Register with your information and and agree to terms and conditions to start your journey with Railway App",
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
