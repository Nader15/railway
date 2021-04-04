import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railway/models/trips.dart';
import 'package:railway/ui/book_ticket.dart';
import 'package:railway/utils/custom_widgets/custom_button.dart';
import 'package:railway/utils/navigator.dart';


class bookTicketBottomSheet extends StatefulWidget {
  Success success;

  bookTicketBottomSheet({this.success});

  @override
  _bookTicketBottomSheetState createState() => _bookTicketBottomSheetState();
}

class _bookTicketBottomSheetState extends State<bookTicketBottomSheet> {

  counter() {
    int count = 0;
    for (int i = 0; i < widget.success.seats.length; i++) {
      if (widget.success.seats[i].status == "available") {
        count++;
      } else
        count = count;
    }
    return count;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                width: 100,
                height: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey.withOpacity(.3),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Details",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "- Station :",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.success.baseStation.name,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "To",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        widget.success.destinationStation.name,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "- Time :",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.success.departTime,
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "To",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        widget.success.arrivalTime,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "- Trip Seats :",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${widget.success.seats.length}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        "- Available Seats :",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "${counter()}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: CustomButton(
                bttnName: "Book Ticket",
                bttnHeight: 55,
                bttnWidth: 368,
                bttnNameSize: 18,
                onPress: () {
                  Navigator.pop(context);
                  navigateAndKeepStack(context, BookTicket(success: widget.success,));

                }),
          ),
        ],
      ),
    );
  }
}
