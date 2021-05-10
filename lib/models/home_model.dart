import 'package:flutter/material.dart';

class HomeModel {
  final String image, title,description;
  final int price, id;
  final Color color;

  HomeModel({this.description, this.color, this.image, this.title, this.price, this.id});
}

List<HomeModel> homeDetails = [
  HomeModel(
      id: 1,
      image: "images/railwaySlider.png",
      description: "First Step : you must Sign up with your information as a first time using this application and our parking services ,if you had an account and already used this application one day so you can sign in easly ."
  ),
  HomeModel(
      id: 1,
      image: "images/railwaySlider.png",
      description: "Second Step : you can login with your registered account , and browsing application and it's features (Home , Profile , Settings , Main Stations and Available Trips ) ."
  ),
  HomeModel(
      id: 1,
      image: "images/railwaySlider.png",
      description:
          "Third Step : You can search for yor destination from trips list and view trips details and available seats ,then  book your tickets "),
];