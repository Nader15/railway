import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:railway/ApiFunctions/shared.dart';
import 'package:railway/ui/login.dart';
import 'package:railway/ui/profile.dart';
import 'package:railway/ui/settings.dart';
import 'package:railway/ui/stations_test.dart';
import 'package:railway/ui/train_tracking.dart';
import 'package:railway/utils/colors_file.dart';
import 'package:railway/utils/global_vars.dart';
import 'package:railway/utils/navigator.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 30,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              onDetailsPressed: () => debugPrint('hello'),
              accountName: Text("${userName}"),
              accountEmail: Text("${userEmail}"),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "images/drawerBackground.jpg",
                    ),
                    alignment: Alignment(1, 0.7),
                    fit: BoxFit.cover),
              ),
              currentAccountPicture: Container(
                padding: EdgeInsets.all(17),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  "images/profile1.svg",
                  fit: BoxFit.cover,
                  width: 10,
                  height: 10,
                  color: whiteColor,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0),
              color: blueAppColor,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.home, color: primaryAppColor),
                    title: Text(
                      'Home Page',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: primaryAppColor),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                      leading: Icon(Icons.person, color: primaryAppColor),
                      title: Text(
                        'My Profile',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryAppColor),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Profile()));
                      }),
                  ListTile(
                      leading: Icon(Icons.location_on, color: primaryAppColor),
                      title: Text(
                        'Stations',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: primaryAppColor),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StationsTest()));
                      }),
                  // ListTile(
                  //     leading: SvgPicture.asset(
                  //       "images/train.svg",
                  //       fit: BoxFit.cover,
                  //       width: 20,
                  //       height: 23,
                  //       color: blackColor,
                  //     ),
                  //     title: Text(
                  //       'Tracking My Train',
                  //       style: TextStyle(fontWeight: FontWeight.bold),
                  //     ),
                  //     onTap: () {
                  //       Navigator.push(
                  //           context,
                  //           MaterialPageRoute(
                  //               builder: (context) => TrainTracking()));
                  //     }),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.phone, color: primaryAppColor),
                    title: Text(
                      'Contact Us',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: primaryAppColor),
                    ),
                    onTap: () {
                      launch("tel://5050");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: primaryAppColor),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: primaryAppColor),
                    ),
                    onTap: () {
                      navigateAndKeepStack(context, Settings());
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.help, color: primaryAppColor),
                    title: new RichText(
                      text: new TextSpan(
                        children: [
                          new TextSpan(
                            text: 'Help',
                            style: new TextStyle(
                                color: primaryAppColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.power_settings_new, color: Colors.red),
                    title: Text(
                      'Logout',
                      style: TextStyle(fontWeight: FontWeight.bold,color: redColor),
                    ),
                    onTap: () {
                      clearAllData().then((value) {
                        navigateAndKeepStack(context, Login());
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
