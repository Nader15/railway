import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:railway/models/stations.dart';
import 'package:railway/models/tickets.dart';
import 'package:railway/models/trips.dart';
import 'package:railway/models/users.dart';
import 'package:railway/ui/home_page.dart';
import 'package:railway/ui/trips.dart';
import 'package:railway/utils/custom_widgets/custom_snackBar.dart';
import 'package:railway/utils/global_vars.dart';
import 'package:railway/utils/navigator.dart';
import 'package:xs_progress_hud/xs_progress_hud.dart';

class Api {
  String baseUrl = 'https://railway-project.herokuapp.com/api/';
  String stationUrl = 'stations';
  String allUsersUrl = 'users';
  String tripsUrl = 'trips';
  String registerUrl = 'token/register';
  String loginUrl = 'token/login';
  String bookTicketUrl = 'tickets';

  BuildContext context;

  Api(@required this.context);

  Future stationApi(GlobalKey<ScaffoldState> _scaffoldKey) async {
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + stationUrl;

    final response = await http.get(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: UserTocken
      },
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      return StationsModel.fromJson(dataContent);
    } else if (response.statusCode == 401) {
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      // clearAllData();
      // navigateAndKeepStack(
      //     context,
      //     Scaffold(
      //       body: Center(
      //         child: Container(
      //           child: Text("Server error\nPlease LogOut and Login again"),
      //         ),
      //       ),
      //     ));
    } else {
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      return false;
    }
  }

  // Future allUsersApi(GlobalKey<ScaffoldState> _scaffoldKey) async {
  //   XsProgressHud.show(context);
  //
  //   final String completeUrl = baseUrl + allUsersUrl;
  //
  //   final response = await http.get(
  //     completeUrl,
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       HttpHeaders.authorizationHeader: UserTocken
  //     },
  //   );
  //   Map<String, dynamic> dataContent = json.decode(response.body);
  //   XsProgressHud.hide();
  //   if (response.statusCode == 200) {
  //     return AllUsersModel.fromJson(dataContent);
  //   } else if (response.statusCode == 401) {
  //     CustomSnackBar(
  //         _scaffoldKey, context, json.decode(response.body).toString());
  //     // clearAllData();
  //     // navigateAndKeepStack(
  //     //     context,
  //     //     Scaffold(
  //     //       body: Center(
  //     //         child: Container(
  //     //           child: Text("Server error\nPlease LogOut and Login again"),
  //     //         ),
  //     //       ),
  //     //     ));
  //   } else {
  //     CustomSnackBar(
  //         _scaffoldKey, context, json.decode(response.body).toString());
  //     return false;
  //   }
  // }

  Future tripsApi(GlobalKey<ScaffoldState> _scaffoldKey) async {
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + tripsUrl;

    final response = await http.get(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: UserTocken
      },
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      return TripsModel.fromJson(dataContent);
    } else if (response.statusCode == 401) {
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      // clearAllData();
      // navigateAndKeepStack(
      //     context,
      //     Scaffold(
      //       body: Center(
      //         child: Container(
      //           child: Text("Server error\nPlease LogOut and Login again"),
      //         ),
      //       ),
      //     ));
    } else {
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      return false;
    }
  }

  Future userRegister(
    GlobalKey<ScaffoldState> _scaffoldKey,
    String name,
    String email,
    String password,
    String passwordConfirmation,
    String phone,
  ) async {
    XsProgressHud.show(context);
    final String apiUrl = baseUrl + registerUrl;
    var data = {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "device_name": "Anonymous Device",
      "admin": "0",
      "phone_number": phone,
    };
    var userToJson = json.encode(data);
    final response = await http.post(
      apiUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      body: userToJson,
    );

    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();

    print("dataContent1:: ${dataContent}");
    print("dataContent2:: ${response.body.toString().contains('errors')}");

    if (!(response.body).toString().contains('errors')) {
      return UsersModel.fromJson(dataContent);
    } else {
      CustomSnackBar(_scaffoldKey, context, dataContent["errors"].toString());
      return false;
    }
  }

  Future userLogin(GlobalKey<ScaffoldState> _scaffoldKey, String email,
      String password) async {
    XsProgressHud.show(context);
    final String apiUrl = baseUrl + loginUrl;
    var data = {
      "email": email,
      "password": password,
      "device_name": "device_name",
      "admin": "1",
    };
    var userToJson = json.encode(data);
    final response = await http.post(
      apiUrl,
      headers: {"Content-Type": "application/json"},
      body: userToJson,
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      print(dataContent.toString());
      return UsersModel.fromJson(dataContent);
    } else {
      CustomSnackBar(_scaffoldKey, context,
          json.decode(response.body)['errors'].toString());
      return false;
    }
  }

  Future bookTicketApi(
    GlobalKey<ScaffoldState> _scaffoldKey,
    int seats,
  ) async {
    XsProgressHud.show(context);
    final String apiUrl = baseUrl + bookTicketUrl;
    var data = {
      "seats": seats,
    };
    var userToJson = json.encode(data);
    final response = await http.post(
      apiUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: UserTocken
      },
      body: userToJson,
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();
    print("dataContent2:: ${response.body.toString().contains('errors')}");

    if (!(response.body).toString().contains('errors')) {
      CustomSnackBar(_scaffoldKey, context, "Ticket Created Successfully");
      // Future.delayed(Duration(seconds: 3), () {
      //   navigateAndClearStack(context, HomePage(currentIndex: 2));
      // });
      print(json.decode(response.body));
      return TripsModel.fromJson(dataContent);
    } else {
      CustomSnackBar(_scaffoldKey, context, dataContent.toString());
      return false;
    }
  }

  Future userTicketsApi(GlobalKey<ScaffoldState> _scaffoldKey) async {
    XsProgressHud.show(context);

    final String completeUrl = baseUrl + bookTicketUrl;

    final response = await http.get(
      completeUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: UserTocken
      },
    );
    Map<String, dynamic> dataContent = json.decode(response.body);
    XsProgressHud.hide();
    if (response.statusCode == 200) {
      return TicketsModel.fromJson(dataContent);
    } else if (response.statusCode == 401) {
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      // clearAllData();
      // navigateAndKeepStack(
      //     context,
      //     Scaffold(
      //       body: Center(
      //         child: Container(
      //           child: Text("Server error\nPlease LogOut and Login again"),
      //         ),
      //       ),
      //     ));
    } else {
      CustomSnackBar(
          _scaffoldKey, context, json.decode(response.body).toString());
      return false;
    }
  }

  Future deleteTicketApi(GlobalKey<ScaffoldState> _scaffoldKey, int Id) async {
    XsProgressHud.show(context);

    print(baseUrl + bookTicketUrl + "/$Id");
    final String apiUrl = baseUrl + bookTicketUrl + "/$Id";
    final response = await http.delete(
      apiUrl,
      headers: {
        "Content-Type": "application/json",
        HttpHeaders.authorizationHeader: UserTocken
      },
    );
    List dataContent = json.decode(response.body);
    // print("dataContent:: ${dataContent}");
    XsProgressHud.hide();
    if (!(response.body).toString().contains('errors')) {

      CustomSnackBar(_scaffoldKey, context, "${dataContent.toString()}");
      Navigator.pop(context);
      Future.delayed(Duration(seconds: 3), () {
        navigateAndClearStack(context, HomePage(currentIndex: 1));
      });
      print(json.decode(response.body));
      return true;
    } else {
      CustomSnackBar(_scaffoldKey, context, response.body.toString());
      return false;
    }
  }
}
