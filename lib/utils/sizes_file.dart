import 'package:flutter/material.dart';

double mediaHeight(context) => MediaQuery.of(context).size.height;

double mediaWidth(context) => MediaQuery.of(context).size.width;

double logoSize(context) => mediaWidth(context) / 4;

double marginUnderLogo(context) => mediaWidth(context) / 8;

double userInputTextFieldWidth(context) => mediaWidth(context) * 1.5;

double userInputTextFieldHeight(context) => mediaWidth(context) * 0.23;

BorderRadius headerCornerRadius = BorderRadius.only(bottomLeft: Radius.circular(50.0));

double borderRadius = 12.0;

double borderWidth = 2.0;

double childAspectRatio = 1.3;

double crossAxisSpacing = 5;

double mainAxisSpacing = 5;


circularProgressHeight(context) => MediaQuery.of(context).size.height - (MediaQuery.of(context).padding.top + MediaQuery.of(context).padding.bottom + MediaQuery.of(context).padding.bottom + kToolbarHeight);



