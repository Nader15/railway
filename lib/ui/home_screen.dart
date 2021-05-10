import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:railway/models/home_model.dart';
import 'package:railway/utils/colors_file.dart';

class HomeScreen extends StatefulWidget {
  final HomeModel product;

  const HomeScreen({Key key, this.product}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> sliderImages = [
    Image(
      image: AssetImage("images/slider1.jpeg"),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage("images/slider2.jpeg"),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage("images/slider3.jpeg"),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage("images/slider4.jpeg"),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage("images/slider5.jpeg"),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage("images/slider6.jpeg"),
      fit: BoxFit.cover,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 200,
                child: CarouselSlider(
                  items: sliderImages,
                  options: CarouselOptions(
                    height: 400,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlayCurve: Curves.easeInOutQuad,
                    autoPlayAnimationDuration: Duration(milliseconds: 1500),
                  ),
                ), //Top Slider
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(left: 13),
                child: Text(
                  'Application Overview',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,color: blueAppColor),
                ),
              ),
              Container(
                // padding: EdgeInsets.only(bottom: 90),
                // height: 361,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:homeDetails.length,
                  itemBuilder: (context, index) {
                    return OverView(product: widget.product,index: index,);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OverView extends StatelessWidget {
  final HomeModel product;
  final int index;

  const OverView({Key key, this.product, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 30, left: 15, right: 15),
          alignment: Alignment.topCenter,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage("${homeDetails[index].image}"),
                fit: BoxFit.cover,
              ),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 20.0)]),
        ),
        Container(
          margin: EdgeInsets.only(left: 40, right: 40, bottom: 20),
          height: 100,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10.0,
                    offset: Offset(1.0, 5.0))
              ],
              // color: Colors.grey.shade200,
              color: whiteColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0))),
          padding: EdgeInsets.all(10.0),
          child: Text("${homeDetails[index].description}"),
        )
      ],
    );
  }
}
