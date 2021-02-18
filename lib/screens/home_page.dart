import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/filter_chips.dart';
import 'categories_page.dart';
import 'favorites_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: theme.accentColor),
        backgroundColor: theme.canvasColor,
        centerTitle: true,
        title: Text(
          'Meals',
          style: TextStyle(
            fontSize: 25.0,
            color: theme.accentColor,
          ),
        ),
        bottom: _currentIndex == 0
            ? PreferredSize(
                preferredSize: Size.fromHeight(55.0),
                child: FiltersChips(),
              )
            : null,
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          CategoriesPage(),
          FavoritesPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: theme.canvasColor,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
