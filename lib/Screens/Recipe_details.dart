import 'package:flutter/material.dart';
import '../state/DummyData.dart';

class Recipe_Details extends StatelessWidget {
  static const routeName = '/RecipeDetails';

  final Function _toggleFavorite;
  final Function _isFavorite;

  Recipe_Details(this._toggleFavorite, this._isFavorite);

  Widget BuilderSubtitle(String str) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        str,
        style: TextStyle(
          fontFamily: 'ConcertOne',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget BuilderSubContext(Widget Child) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purpleAccent),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: 300,
      height: 200,
      child: Child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final id = routeArguments['Id'];

    final selectedRecipes = Recipes.firstWhere((element) => element.id == id);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedRecipes.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              child: Image.network(
                selectedRecipes.image_URL,
                fit: BoxFit.cover,
              ),
            ),
            BuilderSubtitle('Ingradients'),
            SizedBox(
              height: 10,
            ),
            BuilderSubContext(ListView.builder(
                itemBuilder: (ctx, index) => Card(
                      color: Colors.indigo.shade200,
                      shadowColor: Colors.indigo.shade600,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(
                          selectedRecipes.ingradients[index],
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                    ),
                itemCount: selectedRecipes.ingradients.length)),
            BuilderSubtitle('Steps'),
            SizedBox(
              height: 10,
            ),
            BuilderSubContext(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(child: Text('${(index + 1)}')),
                    title: Text(selectedRecipes.steps[index]),
                  ),
                  Divider(
                    color: Colors.purpleAccent,
                  )
                ],
              ),
              itemCount: selectedRecipes.steps.length,
            ))
          ],
        ),
      ),
      //for learing how we can transfer data to caller page when we pop the screen
      floatingActionButton: FloatingActionButton(
          child: Icon(
            _isFavorite(id) ? Icons.star : Icons.star_border,
          ),
          onPressed: () => _toggleFavorite(id)),
    );
  }
}
