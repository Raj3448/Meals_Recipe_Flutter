import 'package:flutter/material.dart';
//import './Drawer_Screen.dart';

class AboutUs extends StatelessWidget {
  static const routeName = '/AboutUs';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //drawer: Drawer_Screen(),
      appBar: AppBar(
        title: Text('About us'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: Text(
          'Welcome to our Dish Recipe app! Discover a wide range of delicious recipes to suit every taste. From appetizers to desserts, our app provides step-by-step instructions and helpful tips. Embark on a culinary journey and create memorable dishes. Happy cooking!',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
