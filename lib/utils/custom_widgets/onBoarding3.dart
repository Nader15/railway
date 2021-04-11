import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:railway/utils/colors_file.dart';

Container onBoarding3(){
  return Container(
    child: Column(
      children: [
        Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset("images/ticketOnBoard.png",height: 200,color: blueAppColor,),
                Image.asset(
                  "images/ticket_sample1.png",
                  height: 50,
                  color: primaryAppColor,
                ),
                SizedBox(height: 20,),
              ],
            ),
        ),
        SizedBox(height: 36.8),
        Container(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              Text(
                "Get Your Ticket",
                style: TextStyle(color: whiteColor, fontSize: 25),
              ),
              SizedBox(height: 17),
              Text(
                "You can book your one ticket or more for your trip and view your booked tickets.",
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