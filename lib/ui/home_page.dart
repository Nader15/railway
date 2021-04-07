import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:railway/ui/home_screen.dart';
import 'package:railway/ui/profile.dart';
import 'package:railway/ui/tickets.dart';
import 'package:railway/ui/trips.dart';
import 'package:railway/utils/colors_file.dart';
import 'package:railway/utils/custom_widgets/custom_home_drawer.dart';

class HomePage extends StatefulWidget {
  int currentIndex;

  HomePage({this.currentIndex = 0});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final items = [
      HomeScreen(),
      Trips(),
      Tickets(),
      Profile(),
    ];
    return Scaffold(
        drawer: CustomHomeDrawer(),
        bottomNavigationBar: Row(
          children: [
            BuildNavBar('images/HomeIcon1.svg', 'images/HomeIcon2.svg', 'Home',
                true, 0),
            BuildNavBar('images/destination2.svg', 'images/destination.svg',
                'Trips', true, 1),
            BuildNavBar(
                'images/ticket.svg', 'images/ticket.svg', 'Tickets', true, 2),
            BuildNavBar('images/profile1.svg', 'images/profile2.svg', 'Profile',
                true, 3),
          ],
        ),
        body: items[widget.currentIndex]);
  }

  Widget BuildNavBar(
      String icon1, String icon2, String name, bool isActive, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.currentIndex = index;
        });
      },
      child: Container(
          alignment: Alignment.center,
          height: 70,
          width: MediaQuery.of(context).size.width / 4,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0,
                offset: Offset(50.0, 10.0),
              )
            ],
            border: Border(
              bottom: BorderSide(
                width: 4,
                color: index == widget.currentIndex
                    ? primaryAppColor
                    : Colors.transparent,
              ),
            ),
            color: Color(0xff173059),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              index == widget.currentIndex
                  ? SvgPicture.asset(
                      icon1,
                      color: index == widget.currentIndex
                          ? primaryAppColor
                          : Colors.grey,
                      width: 22,
                      height: 25,
                    )
                  : SvgPicture.asset(
                      icon2,
                      color: index == widget.currentIndex
                          ? primaryAppColor
                          : Colors.grey,
                      width: 22,
                      height: 22,
                    ),
              SizedBox(height: 10),
              Text(
                name,
                style: TextStyle(
                    color: index == widget.currentIndex
                        ? primaryAppColor
                        : Colors.grey),
              )
            ],
          )),
    );
  }
}
