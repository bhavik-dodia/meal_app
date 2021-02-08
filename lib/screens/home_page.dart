import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meals')),
      body: CategoriesPage(),
    );
  }
}
