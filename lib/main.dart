import 'package:flutter/material.dart';
import 'package:myfirstapp/state/DummyData.dart';
import '../Screens/About_Us_Screen.dart';
import '../Screens/Setting_Screen.dart';
import '../model/FoodRecipeContent.dart';
import 'Screens/Categoris_Screen.dart';
import '/Screens/Category_meal_Screen.dart';
import '/Screens/Recipe_details.dart';
import '/Screens/tab_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MaterialColor _primary_Color = MaterialColor(
    0xFFFF6600, // The 0xFF prefix represents the alpha value (255)
    <int, Color>{
      50: const Color(0xFFFF6600), // Shades of the primary color
      100: const Color(0xFFFF6600),
      200: const Color(0xFFFF6600),
      300: const Color(0xFFFF6600),
      400: const Color(0xFFFF6600),
      500: const Color(0xFFFF6600), // The primary color itself
      600: const Color(0xFFFF6600),
      700: const Color(0xFFFF6600),
      800: const Color(0xFFFF6600),
      900: const Color(0xFFFF6600),
    },
  );

  Map<String, bool> _SettingsData = {
    'glutenfree': false,
    'lactofree': false,
    'vegiterian': false,
    'NonVegiterian': false,
  };

  List<FoodRecipeContent> _sortedDishRecipe = Recipes;

  List<FoodRecipeContent> _FavoriteRecipes = [];

  void setSettingData(Map<String, bool> setSettingdata) {
    setState(() {
      _SettingsData = setSettingdata;

      _sortedDishRecipe = Recipes.where((element) {
        if ((_SettingsData['glutenfree'] ?? false) && element.isGlutenFree) {
          return false;
        }
        if ((_SettingsData['lactofree'] ?? false) && element.isLactoseFree) {
          return false;
        }
        if ((_SettingsData['vegiterian'] ?? false) && element.isVegeterian) {
          return false;
        }
        if ((_SettingsData['NonVegiterian'] ?? false) && element.isNonVeg) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String recipeId) {
    
    final achievedIndex = 
    _FavoriteRecipes.indexWhere((element) => recipeId == element.id);
    if (achievedIndex >= 0) {
      _FavoriteRecipes.removeAt(achievedIndex);
    } else {
    setState(() {
        _FavoriteRecipes.add(
          Recipes.firstWhere((element) => recipeId == element.id),
        );
      });
    }
  }

  bool _isFavorite(String recipeId) {
    return _FavoriteRecipes.any((element) => recipeId == element.id);
  }

  @override
  Widget build(BuildContext context) {
    final themeContent = TextStyle(
      fontFamily: 'Robot',
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
    return MaterialApp(
        title: 'Dish Recipe',
        theme: ThemeData(
          primarySwatch: _primary_Color,
          secondaryHeaderColor: Colors.amber,
          fontFamily: 'Robot',
          // textTheme: ThemeData.light().textTheme.copyWith(
          //       subtitle1: TexStyle(
          //         color: Colors.deepOrangeAccent,
          //       ),
          //       subtitle2: TextStyle(
          //         color: Colors.indigoAccent,
          //       ),
          //       titleMedium: TextStyle(
          //         fontFamily: 'ConcertOne',
          //         fontSize: 28,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
        ),
        home: TabScreen(themeContent, _FavoriteRecipes),
        routes: {
          '/CategoryScreen': (context) => CategoriesScreen(),
          Category_Meal_Screen.routeName: (ctx) =>
              Category_Meal_Screen(_sortedDishRecipe),
          Recipe_Details.routeName: (ctx) =>
              Recipe_Details(_toggleFavorite, _isFavorite),
          AboutUs.routeName: (ctx) => AboutUs(),
          Settings.routeName: (ctx) => Settings(_SettingsData, setSettingData),
        });
  }
}
