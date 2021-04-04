import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:railway/utils/colors_file.dart';
import 'package:railway/utils/global_vars.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryAppColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.arrow_back_outlined,color: blackColor,),
          ),
          title: Text(
            "Welcome ${userName}",
            style: TextStyle(color: blackColor),
          ),
          centerTitle: true,
          backgroundColor: primaryAppColor,
        ),
        floatingActionButton: _buildFloatingButton(),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: 240,
                width: double.infinity,
                child: Image(
                  image: AssetImage("images/drawerBackground.jpg"),
                  alignment: Alignment(0,.8),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 0.0),
                child: Column(
                  children: <Widget>[
                    new Container(
                      height: 100,
                      width: 400,
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.only(top: 16.0),
                      decoration: BoxDecoration(
                          color:whiteColor,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Container(
                        margin: EdgeInsets.only(left: 50.0),
                        child: ListTile(
                          contentPadding: EdgeInsets.only(left: 50.0),
                          title: Text("${userName}",
                              style: Theme.of(context).textTheme.title),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 195.0, left: 35.0),
                padding: EdgeInsets.all(17),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: primaryAppColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: SvgPicture.asset(
                  "images/profile1.svg",
                  fit: BoxFit.cover,
                  width: 10,
                  height: 10,
                  color: whiteColor,
                ),
              ),
              // new Container(
              //   margin: EdgeInsets.only(top: 195.0, left: 35.0),
              //   height: 80.0,
              //   width: 80.0,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(10.0),
              //     image: new DecorationImage(
              //         alignment: Alignment(0, -0.4),
              //         image: AssetImage(
              //             "images/profileImage.jpg"),
              //         fit: BoxFit.cover),
              //   ),
              // ),
              Container(
                height: 370,
                margin: EdgeInsets.only(
                    top: 340, right: 15.0, left: 15.0, bottom: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 15),
                      child: Text('Client Information'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email, color: primaryAppColor),
                      title: Text('Email'),
                      subtitle: Text("${userEmail}"),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone, color: primaryAppColor),
                      title: Text('Phone'),
                      subtitle: Text('+20-' "${userPhone}"),
                    ),
                    ListTile(
                      leading: Icon(Icons.home, color: primaryAppColor),
                      title: Text('Wallet'),
                      subtitle: Text("-----"),
                    ),
                    ListTile(
                      leading: Icon(Icons.date_range, color: primaryAppColor),
                      title: Text('Joined date'),
                      subtitle: Text('${userJoinedTime.split("T")[0]}'),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 60,
                    margin: EdgeInsets.only(
                        top: 740, right: 15.0, left: 15.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text('Favourite Stations',style: TextStyle(fontWeight: FontWeight.bold),),
                          trailing: Icon(Icons.favorite,color: redColor,),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,bottom: 50),
                    child: Column(
                      children: [
                        favouriteStations("Cairo","Aswan"),
                        favouriteStations("Zagazig","Mansoura"),
                        favouriteStations("cairo","Sharm"),
                      ],
                    )
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget favouriteStations(String location , String destination){
    return Container(
      child: Card(
        elevation: 10,
        child: ListTile(
          onTap: (){},
          contentPadding: EdgeInsets.only(left:50,right: 50),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(location,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SvgPicture.asset(
                "images/train.svg",
                color: blackColor,
                height: 30,
              ),
              Text(destination,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingButton() {
    return RaisedButton(
      onPressed: () {},
      color: blackColor,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.edit,
            size: 25.0,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Text(
            'Edit Profile',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
