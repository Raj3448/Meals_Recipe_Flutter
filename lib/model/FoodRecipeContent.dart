//import 'package:flutter/material.dart';
enum Complexity {
  Simply,
  Medium,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxeries,
}

class FoodRecipeContent {
  final String id;
  final List<String> categories;
  final String title;
  final String image_URL;
  final List<String> ingradients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isNonVeg;
  final bool isVegeterian;

  const FoodRecipeContent({
    required this.id,
    required this.categories,
    required this.title,
    required this.image_URL,
    required this.ingradients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isNonVeg,
    required this.isVegeterian,
  });
}
