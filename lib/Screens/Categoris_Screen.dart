import 'package:flutter/material.dart';
import '../state/DummyData.dart';
import '../widget/Category_Item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: Dummy_Categories.map(
        (Variety) => Category_Item(
          Variety.id,
          Variety.title,
          Variety.color,
        ),
      ).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
