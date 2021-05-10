import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

import 'package:railway/ApiFunctions/shared.dart';
import 'package:railway/ui/home_page.dart';
import 'package:railway/ui/second.dart';
import 'package:railway/utils/colors_file.dart';
import 'package:railway/utils/global_vars.dart';





// ignore: camel_case_types
class SplashScreen extends StatefulWidget {
  @override
  _openState createState() => _openState();
}

// ignore: camel_case_types
class _openState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      getUserTocken(context).then((value) {

        print("UserTocken:: ${UserTocken}");
        // print("UserWallet:: ${UserWallet}");
        if(UserTocken=="null"){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Second()));

        }
        else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));

        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("images/train.svg",color: blueAppColor,height: 100,),
              SizedBox(height: 20),
              Text("Railway",style: TextStyle(color:blueAppColor,fontSize: 40 ),),
            ],
          )
      ),
    );
  }
}
