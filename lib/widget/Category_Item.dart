import 'package:flutter/material.dart';
import 'package:myfirstapp/Screens/Category_meal_Screen.dart';
//import '/Category_meal_Screen.dart';
//import '../model/Category.dart';

class Category_Item extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  Category_Item(this.id, this.title, this.color);

  final BodyFont = TextStyle(
    fontFamily: 'ConcertOne',
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  void renderingCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(MaterialPageRoute(
    //     builder: (_) =>
    //         Category_Meal_Screen(id, title, themecontent, BodyFont)));      => this is one method for showing new navigator page by using push

    Navigator.of(ctx).pushNamed(Category_Meal_Screen.routeName, arguments: {
      'Id': id,
      'Title': title,
      'bodyFont': BodyFont
    } //this is another method for rendering new screen
        //'/CategoryMeals' , arguments .... same as above line
        );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => renderingCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: BodyFont,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color.withOpacity(0.7),
            color,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
