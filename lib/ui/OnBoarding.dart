import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railway/ui/login.dart';
import 'package:railway/ui/signUp.dart';
import 'package:railway/utils/colors_file.dart';
import 'package:railway/utils/custom_widgets/backgrount.dart';
import 'package:railway/utils/custom_widgets/custom_button.dart';
import 'package:railway/utils/custom_widgets/onBoarding1.dart';
import 'package:railway/utils/custom_widgets/onBoarding2.dart';
import 'package:railway/utils/custom_widgets/onBoarding3.dart';
import 'package:railway/utils/navigator.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _Indicator(true) : _Indicator(false));
    }
    return list ;
  }

  Widget _Indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 11,
      width: 11,
      decoration: BoxDecoration(
          color: isActive ? primaryAppColor : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Background(),
        SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                          onTap: () {
                            navigateAndClearStack(context, Login());
                          },
                          child: RichText(
                            text: TextSpan(
                              text: "Sign in",
                              style: TextStyle(
                                fontSize: 16,
                                color: primaryAppColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 500,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: [
                        onBoarding1(),
                        onBoarding2(),
                        onBoarding3(),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  SizedBox(height: 30),
                  _currentPage==2 ? CustomButton(
                      bttnName: 'Get Start',
                      bttnHeight: 55,
                      bttnWidth: 368,
                      bttnNameSize: 18,
                      onPress: () {
                        navigateAndClearStack(context, SignUp());
                      })
                      : CustomButton(
                      bttnName: 'Next',
                      bttnHeight: 55,
                      bttnWidth: 368,
                      bttnNameSize: 18,
                      onPress: () {}),
                ],
              )),
        ),
      ],
    ));
  }
}
