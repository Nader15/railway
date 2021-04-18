// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:railway_v1/ApiFunctions/Api.dart';
// import 'package:railway_v1/models/stations.dart';
// import 'package:railway_v1/ui/home_page.dart';
// import 'package:railway_v1/ui/trips_model.dart';
// import 'package:railway_v1/utils/colors_file.dart';
// import 'package:railway_v1/utils/custom_widgets/custom_button.dart';
// import 'package:railway_v1/utils/global_vars.dart';
// import 'package:railway_v1/utils/navigator.dart';
//
// class AddTrip extends StatefulWidget {
//   @override
//   _AddTripState createState() => _AddTripState();
// }
//
// class _AddTripState extends State<AddTrip> {
//   StationsModel stationsModel;
//   List<Success> stationsList = List();
//   // var pickDate1;
//   // TimeOfDay pickTime1;
//   // var pickDate2;
//   // TimeOfDay pickTime2;
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.delayed(Duration(milliseconds: 0), () {
//       gettingData();
//     });
//   }
//
//   gettingData() {
//     setState(() {
//       Api(context).stationApi(_scaffoldKey).then((value) {
//         stationsModel = value;
//         stationsModel.success.forEach((element) {
//           setState(() {
//             stationsList.add(element);
//           });
//         });
//       });
//     });
//   }
//
//   var departmentDateController = TextEditingController();
//   var departmentTimeController = TextEditingController();
//   var arrivalDateController = TextEditingController();
//   var arrivalTimeController = TextEditingController();
//
//   DateTime selectedDate = DateTime.now();
//   TimeOfDay selectedTime = TimeOfDay.now();
//
//   Future<void> _selectDateDepart(BuildContext context) async {
//     final DateTime picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime(1950, 8),
//         lastDate: DateTime(2101));
//     if (picked != null)
//       setState(() {
//         selectedDate = picked;
//         departmentDateController.text =
//             selectedDate.toIso8601String().split("T")[0];
//         trip_departmentTime = departmentDateController.text;
//       });
//   }
//
//   Future<void> _selectDateArrival(BuildContext context) async {
//     final DateTime picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime(1950, 8),
//         lastDate: DateTime(2101));
//     if (picked != null)
//       setState(() {
//         selectedDate = picked;
//         arrivalDateController.text =
//             selectedDate.toIso8601String().split("T")[0];
//         trip_departmentTime = arrivalDateController.text;
//       });
//   }
//
//   Future<void> _selectTimeDepart(BuildContext context) async {
//     final TimeOfDay picked =
//         await showTimePicker(context: context, initialTime: selectedTime);
//     if (picked != null && picked != selectedTime)
//       setState(() {
//         selectedTime = picked;
//         departmentTimeController.text = selectedTime.format(context).split(" ")[0];
//         trip_arrivalTime = arrivalDateController.text;
//       });
//   }
//
//   Future<void> _selectTimeArrival(BuildContext context) async {
//     final TimeOfDay picked =
//         await showTimePicker(context: context, initialTime: selectedTime);
//     if (picked != null && picked != selectedTime)
//       setState(() {
//         selectedTime = picked;
//         arrivalTimeController.text = selectedTime.format(context).split(" ")[0];
//         trip_arrivalTime = arrivalDateController.text;
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//           leading: Container(),
//           backgroundColor: primaryAppColor,
//           bottom: PreferredSize(
//             preferredSize: Size.square(20),
//             child: Container(
//               // height: 200,
//               child: Column(
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.only(right: 30, left: 20),
//                     child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Add Trip",
//                           style: TextStyle(
//                             color: blackColor,
//                             fontSize: 25,
//                           ),
//                         )),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               ),
//             ),
//           )),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 padding: EdgeInsets.only(left: 10, right: 10),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                     color: Colors.grey.withOpacity(.1),
//                     borderRadius: BorderRadius.circular(5)),
//                 child: DropdownButton(
//                   hint: Text(
//                     "Choose Base Station",
//                     style: TextStyle(
//                         // color: Color(0xffb8c3cb).withOpacity(0.5),
//                         ),
//                   ),
//                   icon: Icon(Icons.keyboard_arrow_down, color: Color(0xffb8c3cb)),
//                   isExpanded: true,
//                   underline: SizedBox(),
//                   dropdownColor: whiteColor,
//                   style: TextStyle(color: blackColor),
//                   value: trip_base_id,
//                   onChanged: (newValue) {
//                     setState(() {
//                       trip_base_id = newValue;
//                       print(trip_base_id);
//                     });
//                   },
//                   items: stationsList.map((valueItem) {
//                     return DropdownMenuItem(
//                       value: valueItem.id,
//                       child: Text(valueItem.name),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 padding: EdgeInsets.only(left: 10, right: 10),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                     color: Colors.grey.withOpacity(.1),
//                     borderRadius: BorderRadius.circular(5)),
//                 child: DropdownButton(
//                   hint: Text(
//                     "Choose Destination Station",
//                     style: TextStyle(
//                         // color: Color(0xffb8c3cb).withOpacity(0.5),
//                         ),
//                   ),
//                   icon: Icon(Icons.keyboard_arrow_down, color: Color(0xffb8c3cb)),
//                   isExpanded: true,
//                   underline: SizedBox(),
//                   dropdownColor: whiteColor,
//                   style: TextStyle(color: blackColor),
//                   value: trip_destination_id,
//                   onChanged: (newValue) {
//                     setState(() {
//                       trip_destination_id = newValue;
//                       print(trip_destination_id);
//                     });
//                   },
//                   items: stationsList.map((valueItem) {
//                     return DropdownMenuItem(
//                       value: valueItem.id,
//                       child: Text(valueItem.name),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width / 2.3,
//                       child: TextFormField(
//                         controller: departmentDateController,
//                         onTap: () => _selectDateDepart(context),
//                         decoration: InputDecoration(
//                             fillColor: Colors.grey.withOpacity(.1),
//                             filled: true,
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide.none,
//                                 borderRadius: BorderRadius.circular(5)),
//                             contentPadding: new EdgeInsets.symmetric(
//                                 vertical: 0, horizontal: 10),
//                             hintText: "Department Date",
//                             suffixIcon: Icon(Icons.keyboard_arrow_down,
//                                 color: Color(0xffb8c3cb)),
//                             hintStyle:
//                                 TextStyle(color: blackColor, fontSize: 13)),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width / 2.3,
//                       child: TextFormField(
//                         controller: departmentTimeController,
//                         onTap: ()=>_selectTimeDepart(context),
//                         decoration: InputDecoration(
//                             fillColor: Colors.grey.withOpacity(.1),
//                             filled: true,
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide.none,
//                                 borderRadius: BorderRadius.circular(5)),
//                             contentPadding: new EdgeInsets.symmetric(
//                                 vertical: 0, horizontal: 10),
//                             hintText: "Department time",
//                             suffixIcon: Icon(Icons.keyboard_arrow_down,
//                                 color: Color(0xffb8c3cb)),
//                             hintStyle:
//                                 TextStyle(color: blackColor, fontSize: 13)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width / 2.3,
//                       child: TextFormField(
//                         controller: arrivalDateController,
//                         onTap: () => _selectDateArrival(context),
//                         decoration: InputDecoration(
//                             fillColor: Colors.grey.withOpacity(.1),
//                             filled: true,
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide.none,
//                                 borderRadius: BorderRadius.circular(5)),
//                             contentPadding: new EdgeInsets.symmetric(
//                                 vertical: 0, horizontal: 10),
//                             hintText: "Arrival Date",
//                             suffixIcon: Icon(Icons.keyboard_arrow_down,
//                                 color: Color(0xffb8c3cb)),
//                             hintStyle:
//                                 TextStyle(color: blackColor, fontSize: 13)),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width / 2.3,
//                       child: TextFormField(
//                         controller: arrivalTimeController,
//                         onTap: ()=>_selectTimeArrival(context),
//                         decoration: InputDecoration(
//                             fillColor: Colors.grey.withOpacity(.1),
//                             filled: true,
//                             border: OutlineInputBorder(
//                                 borderSide: BorderSide.none,
//                                 borderRadius: BorderRadius.circular(5)),
//                             contentPadding: new EdgeInsets.symmetric(
//                                 vertical: 0, horizontal: 10),
//                             hintText: "Arrival time",
//                             suffixIcon: Icon(Icons.keyboard_arrow_down,
//                                 color: Color(0xffb8c3cb)),
//                             hintStyle:
//                                 TextStyle(color: blackColor, fontSize: 13)),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 50,
//               ),
//               CustomButton(
//                 bttnName: 'Save',
//                 bttnHeight: 55,
//                 bttnWidth: 368,
//                 bttnNameSize: 20,
//                 onPress: () {
//                   Api(context)
//                       .addTripApi(
//                     _scaffoldKey,
//                     trip_base_id,
//                     trip_destination_id,
//                     departmentDateController.text+" "+departmentTimeController.text,
//                     arrivalDateController.text+" "+arrivalTimeController.text,
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
