import 'package:flutter/material.dart';
import '/Screens/Recipe_details.dart';
import '../model/FoodRecipeContent.dart';

class DishItem extends StatelessWidget {
  final String title;
  final String ImageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  final String id;

  DishItem({
    required this.id,
    required this.title,
    required this.ImageURL,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });
  String get complexityText {
    switch (complexity) {
      case Complexity.Simply:
        return 'simple';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Medium:
        return 'Medium';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxeries:
        return 'Expensive';
    }
  }

  void selectDish(BuildContext context) {
    Navigator.of(context).pushNamed(Recipe_Details.routeName, arguments: {
      'Id': id,
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () => selectDish(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    ImageURL,
                    height: 270,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 230,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white60,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text('$duration' + 'min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.currency_rupee),
                      SizedBox(
                        width: 10,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
