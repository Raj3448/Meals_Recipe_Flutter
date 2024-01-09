import 'package:flutter/material.dart';
import 'package:myfirstapp/Screens/Categoris_Screen.dart';
import 'package:myfirstapp/Screens/Drawer_Screen.dart';
import 'package:myfirstapp/Screens/Favorite_Screen.dart';
import 'package:myfirstapp/model/FoodRecipeContent.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/tabScreen';
  final NavigatorThemeContent;
  final List<FoodRecipeContent> _favorite_recipe;
  TabScreen(this.NavigatorThemeContent, this._favorite_recipe);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> _pages = [];
  int selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      CategoriesScreen(),
      FavoriteScreeen(widget._favorite_recipe),
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dish Recipe'),
        ),
        drawer: Drawer_Screen(),
        body: _pages[selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          currentIndex: selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Variety',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite'),
          ],
        ),
      ),
    );
  }
}
