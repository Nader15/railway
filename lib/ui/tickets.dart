import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:railway/ApiFunctions/Api.dart';
import 'package:railway/models/tickets.dart';
import 'package:railway/utils/colors_file.dart';
import 'package:railway/utils/global_vars.dart';


class Tickets extends StatefulWidget {
  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  TicketsModel ticketsModel;
  List<Success> ticketsList = List();



  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 0), () {
      gettingData();
    });
//    showHud();
  }

  gettingData() {
    setState(() {
      Api(context).userTicketsApi(_scaffoldKey).then((value) {
        ticketsModel = value;
        ticketsModel.success.forEach((element) {
          setState(() {
            ticketsList.add(element);
          });
        });
      });
    });
  }

  final f = new DateFormat('yyyy-MM-dd hh:mm');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Container(),
          backgroundColor: blueAppColor,
          bottom: PreferredSize(
            preferredSize: Size.square(20),
            child: Container(
              padding: EdgeInsets.only(bottom: 20),
              // height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 30, left: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Your Tickets",
                          style: TextStyle(
                            color: primaryAppColor,
                            fontSize: 25,
                          ),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${ticketsList.length}",
                        style: TextStyle(fontSize: 25,color: primaryAppColor),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 10, left: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SvgPicture.asset(
                            "images/ticket.svg",
                            color: primaryAppColor,
                            width: 12,
                            height: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                ],
              ),
            ),
          )),
      backgroundColor: blueAppColor,
      body: SafeArea(
        child: ticketsList.length == 0
            ? Center(
                child: Text(
                  "You have no tickets.",
                  style: TextStyle(fontSize: 20,color: primaryAppColor),
                ),
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  // padding: EdgeInsets.all(20),
                  itemCount: ticketsList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                "images/ticket_sample1.png",
                                height: 130,
                                color: primaryAppColor,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 200, top: 20),
                              alignment: Alignment.topCenter,
                              child: Text(
                                "${userId}",
                                style: TextStyle(
                                    fontSize: 15, color: blueAppColor),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 200, top: 50),
                              alignment: Alignment.topCenter,
                              child: SvgPicture.asset(
                                "images/train.svg",
                                color: blueAppColor,
                                height: 30,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 200, top: 100),
                              alignment: Alignment.topCenter,
                              child: Text(
                                "${ticketsList[index].tripData.price} EGP",
                                style: TextStyle(
                                    fontSize: 15, color: blueAppColor),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 200, top: 20),
                              alignment: Alignment.topCenter,
                              child: Text(
                                "${ticketsList[index].tripData.trip.baseStation.name.toString()}",
                                style: TextStyle(
                                    fontSize: 15, color: blueAppColor),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              alignment: Alignment.topCenter,
                              child: Text(
                                "${ticketsList[index].tripData.trip.destinationStation.name}",
                                style: TextStyle(
                                    fontSize: 15, color: blueAppColor),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 200, top: 55),
                              alignment: Alignment.topCenter,
                              child: Icon(
                                Icons.airline_seat_recline_normal_sharp,
                                color: blueAppColor,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 60),
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Class ${ticketsList[index].tripData.Class}",
                                style: TextStyle(
                                    fontSize: 15, color: blueAppColor),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 200, top: 100),
                              alignment: Alignment.topCenter,
                              child: Text(
                                "${ticketsList[index].tripData.trip.departTime.split(":")[0] + ":" + ticketsList[index].tripData.trip.departTime.split(":")[1]}",
                                style: TextStyle(
                                    fontSize: 15, color: blueAppColor),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 100),
                              alignment: Alignment.topCenter,
                              child: Text(
                                "${ticketsList[index].tripData.trip.arrivalTime.split(":")[0] + ":" + ticketsList[index].tripData.trip.arrivalTime.split(":")[1]}",
                                style: TextStyle(
                                    fontSize: 15, color: blueAppColor),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text("${ticketsList[index].ticketTime.split(".")[0].split("T")}",style: TextStyle(color: primaryAppColor),),
                        ),
                        Divider(
                          thickness: 0,
                          color: primaryAppColor,
                        )
                      ],
                    );
                  },
                ),
              ),
      ),
    );
  }
}
