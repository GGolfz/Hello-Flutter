import 'package:flutter/material.dart';
import './cetegories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _pages;
  int pageIndex = 0;
  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Your Favorites'}
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TopBar Tab
    // return DefaultTabController(
    //   length: 2,
    //   initialIndex: 0,
    //   child: Scaffold(
    //       appBar: AppBar(
    //         title: Text('Meals'),
    //         bottom: TabBar(tabs: <Widget>[
    //           Tab(icon: Icon(Icons.category), text: "Categories"),
    //           Tab(icon: Icon(Icons.star), text: "Favorites"),
    //         ]),
    //       ),
    //       body: TabBarView(
    //         children: <Widget>[CategoriesScreen(), FavoritesScreen()],
    //       )),
    // );
    return Scaffold(
      appBar: AppBar(title: Text(_pages[pageIndex]['title'])),
      drawer: MainDrawer(),
      body: _pages[pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: pageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              label: "Favorites"),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
