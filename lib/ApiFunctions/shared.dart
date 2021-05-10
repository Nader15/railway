import 'package:flutter/material.dart';
import 'package:railway/utils/global_vars.dart';
import 'package:shared_preferences/shared_preferences.dart';

String UserAuth="UserAuth";
String UserId="UserId";
String UserName="UserName";
String UserEmail="UserEmail";
String UserPhone="phone_number";
String UserWallet="UserWallet";
String UserJoinedTime="created_at";

Future<String> getUserTocken(BuildContext context,) async {
  // save the chosen locale
  var prefs = await SharedPreferences.getInstance();
  UserTocken="${prefs.getString(UserAuth)}";
  userId=prefs.getInt(UserId);
  userName=prefs.getString(UserName);
  userEmail=prefs.getString(UserEmail);
  userPhone=prefs.getString(UserPhone);
  userWallet=prefs.getInt(UserWallet);
  userJoinedTime=prefs.getString(UserJoinedTime);

  print("userId  ${userId}");
  print("userWallet  ${userWallet}");
  print("UserTocken  ${UserTocken}");
  return prefs.getString(UserAuth);

}

Future setUserTocken({String auth_token,int userId,String userName,String userEmail,String userPhone,int userWallet,String ,String userJoinedTime}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(UserAuth , "Bearer $auth_token");
  await prefs.setString(UserName , userName);
  await prefs.setString(UserEmail , userEmail);
  await prefs.setString(UserPhone , userPhone);
  await prefs.setInt(UserWallet , userWallet);
  await prefs.setString(UserJoinedTime , userJoinedTime);
  await prefs.setInt(UserId , userId);

}

Future clearAllData({String auth_token}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();

}