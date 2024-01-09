import 'package:flutter/material.dart';
import 'package:myfirstapp/model/FoodRecipeContent.dart';
import '../widget/dish_Item.dart';

class FavoriteScreeen extends StatelessWidget {
  final List<FoodRecipeContent> favorite_recipe;

  const FavoriteScreeen(this.favorite_recipe);

  @override
  Widget build(BuildContext context) {
    return favorite_recipe.isEmpty
        ? const Center(
            child: Text(
              'You don\'t have any favarite recipe',
              style: TextStyle(
                fontFamily: 'ConcertOne',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return DishItem(
                id: favorite_recipe[index].id,
                title: favorite_recipe[index].title,
                ImageURL: favorite_recipe[index].image_URL,
                duration: favorite_recipe[index].duration,
                complexity: favorite_recipe[index].complexity,
                affordability: favorite_recipe[index].affordability,
              );
            },
            itemCount: favorite_recipe.length,
          );
  }
}
