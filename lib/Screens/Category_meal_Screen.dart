//After clicking the Category Item then below screen will be open
//import 'dart:js';

import 'package:flutter/material.dart';
import '../model/FoodRecipeContent.dart';
import '../widget/dish_Item.dart';

class Category_Meal_Screen extends StatefulWidget {
  static const routeName = '/CategoryMeal';
  final List<FoodRecipeContent> _sortedDishRecipe;

  Category_Meal_Screen(this._sortedDishRecipe);

  @override
  State<Category_Meal_Screen> createState() => _Category_Meal_ScreenState();
}

class _Category_Meal_ScreenState extends State<Category_Meal_Screen> {
  String CategoryTitle = '';

  List<FoodRecipeContent> displayedDishes = [];
  bool _loadedInitData = false;

  // final BodyFont;
  void didChangeDependencies() {
    if (_loadedInitData == false) {
      final routes_Argu =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

      CategoryTitle = routes_Argu['Title'];
      final CategoryId = routes_Argu['Id'];
      //final BodyFont = routes_Argu['bodyFont'];
      displayedDishes = widget._sortedDishRecipe.where((entity) {
        return entity.categories.contains(CategoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeDish(String removeId) {
    setState(() {
      displayedDishes.removeWhere((element) => element.id == removeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final routes_Argu =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    // final CategoryTitle = routes_Argu['Title'];
    // final CategoryId = routes_Argu['Id'];
    // final NavigatorThemeContent = routes_Argu['ThemeContent'];
    // //final BodyFont = routes_Argu['bodyFont'];
    // final FoodRecipeSortedContent = Recipes.where((entity) {
    //   return entity.categories.contains(CategoryId);
    // }).toList();

    return Scaffold(
      appBar: AppBar(
          title: Text(
        CategoryTitle,
        style: TextStyle(
          fontFamily: 'ConcertOne',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      )),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return DishItem(
            id: displayedDishes[index].id,
            title: displayedDishes[index].title,
            ImageURL: displayedDishes[index].image_URL,
            duration: displayedDishes[index].duration,
            complexity: displayedDishes[index].complexity,
            affordability: displayedDishes[index].affordability,
          );
        },
        itemCount: displayedDishes.length,
      ),
    );
  }
}
