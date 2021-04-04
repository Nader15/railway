// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:railway_v1/ApiFunctions/Api.dart';
// import 'package:railway_v1/models/users.dart';
// import 'package:railway_v1/ui/Admin/allUsers_model.dart';
// import 'package:railway_v1/ui/signUp.dart';
// import 'package:railway_v1/utils/colors_file.dart';
// import 'package:railway_v1/utils/navigator.dart';
//
// class Users extends StatefulWidget {
//   @override
//   _UsersState createState() => _UsersState();
// }
//
// class _UsersState extends State<Users> {
//   AllUsersModel allUsersModel;
//   List<Success> usersList = List();
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
// //    showHud();
//   }
//
//   gettingData() {
//     setState(() {
//       Api(context).allUsersApi(_scaffoldKey).then((value) {
//         allUsersModel = value;
//         allUsersModel.success.forEach((element) {
//           setState(() {
//             usersList.add(element);
//           });
//         });
//         // usersList = usersList.reversed.toList();
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: primaryAppColor,
//         onPressed: () {
//           navigateAndClearStack(context, SignUp());
//         },
//         child: Icon(
//           Icons.add,
//           color: blackColor,
//           size: 30,
//         ),
//       ),
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
//                           "All Users",
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
//       body: Center(
//         child: usersList.length == 0
//             ? Container(
//                 child: Text("The System Has No Users Yet . "),
//               )
//             : Container(
//                 child: ListView.builder(
//                 itemCount: usersList.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     onTap: () {
//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               backgroundColor: Color(0xff1D1D1D),
//                               title: Text(
//                                 "${usersList[index].name}",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(20)),
//                               actions: [
//                                 FlatButton(
//                                     onPressed: () {
//                                       Api(context)
//                                           .deleteUserApi(
//                                               _scaffoldKey, usersList[index].id);
//                                     },
//                                     child: Text(
//                                       "delete",
//                                     )),
//                                 FlatButton(
//                                     onPressed: () {
//                                       Navigator.of(context).pop();
//                                     },
//                                     child: Text(
//                                       "cancel",
//                                     ))
//                               ],
//                               content: Container(
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.2,
//                                 child: Center(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       SizedBox(
//                                         height: 20,
//                                       ),
//                                       Text(
//                                         "Id: ${usersList[index].id}",
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       Text(
//                                         "Email : ${usersList[index].email}",
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       Text(
//                                         "Phone : ${usersList[index].phoneNumber}",
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                       SizedBox(
//                                         height: 10,
//                                       ),
//                                       Text(
//                                         "Created at : ${usersList[index].createdAt.split(".")[0].split("T")[0]}  ${usersList[index].createdAt.split(".")[0].split("T")[1]}",
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             );
//                           });
//                     },
//                     leading: Container(
//                       padding: EdgeInsets.all(14),
//                       height: 60,
//                       width: 50,
//                       decoration: BoxDecoration(
//                         color: Colors.grey,
//                         shape: BoxShape.circle,
//                       ),
//                       child: SvgPicture.asset(
//                         "images/profile1.svg",
//                         fit: BoxFit.cover,
//                         width: 30,
//                         height: 30,
//                         color: whiteColor,
//                       ),
//                     ),
//                     title: Text(
//                       "${usersList[index].name}",
//                       style: TextStyle(
//                         color: blackColor,
//                         fontSize: 20,
//                       ),
//                     ),
//                     subtitle: Text(
//                       "${usersList[index].email}",
//                     ),
//                   );
//                 },
//               )),
//       ),
//     );
//   }
// }
