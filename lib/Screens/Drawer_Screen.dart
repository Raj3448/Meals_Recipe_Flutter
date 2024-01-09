import 'package:flutter/material.dart';
import './About_Us_Screen.dart';
import './Setting_Screen.dart';

class Drawer_Screen extends StatelessWidget {
  final themeContext = TextStyle(
    fontFamily: 'ConcertOne',
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  Widget BuildDrawerItem(
      IconData icon, String text, void Function()? renderingFunction) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontFamily: 'ConcertOne',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: renderingFunction,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(children: [
        Container(
          height: 200,
          width: double.infinity,
          color: Colors.cyan,
          padding: EdgeInsets.all(20),
          child: Center(
            child: Text(
              'Cooking up 🍳',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: const Color.fromARGB(255, 255, 42, 0)),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        // BuildDrawerItem(Icons.restaurant, 'Dishes', () {
        //   Navigator.of(context).pushReplacementNamed('/');
        // }),
        SizedBox(
          height: 10,
        ),
        BuildDrawerItem(Icons.record_voice_over, 'About us', () {
          Navigator.of(context).pushNamed(AboutUs.routeName);
        }),
        SizedBox(
          height: 10,
        ),
        BuildDrawerItem(Icons.settings, 'Setting', () {
          Navigator.of(context).pushNamed(Settings.routeName);
        })
      ]),
    );
  }
}
