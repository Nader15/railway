import 'package:flutter/material.dart';
import 'package:railway/ui/login.dart';
import 'package:railway/utils/colors_file.dart';
import 'package:railway/utils/global_vars.dart';
import 'package:railway/utils/navigator.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text('Settings',style: TextStyle(color: primaryAppColor),),
        centerTitle: true,
        backgroundColor: blueAppColor,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: primaryAppColor,),
        ),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(top: 20,left: 20,bottom: 10),
            child: Text('Account',style: TextStyle(
                fontSize: 25.0,color: blueAppColor,
            ),),
          ),
          new Card(
            margin: EdgeInsets.symmetric(vertical: 6,horizontal: 20),
            elevation: 10,
            child: Column(
              children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.only(left: 20,top: 5),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        "images/profileImage.jpg"),radius: 20,
                    backgroundColor: Colors.white,
                  ),
                  title: Text("${userName}"),
                  onTap: (){},
                ),
              ],
            ),
          ),

          Card(
            margin: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
            elevation: 10,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.phone,color: Colors.grey),
                      SizedBox(width: 20),
                      Text('${userPhone}'),
                    ],
                  ),
                  onTap: (){},
                ),
                Divider(),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.email,color: Colors.grey),
                      SizedBox(width: 20),
                      Text('${userEmail}'),
                    ],
                  ),
                  onTap: (){},
                ),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.only(top: 20,left: 20,bottom: 10),
            child: Text('Security',style: TextStyle(
                fontSize: 25.0,color: blueAppColor,
            ),),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 0,horizontal: 20),
            elevation: 10,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.lock,color: Colors.grey),
                      SizedBox(width: 20),
                      Text('Change password'),
                    ],
                  ),
                  onTap: (){},
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Card(
            elevation: 10,
            margin: EdgeInsets.symmetric(vertical: 6,horizontal: 20),
            child: ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: (){
                navigateAndClearStack(context,Login());
              },

            ),
          )
        ],
      ),
    );
  }
}
