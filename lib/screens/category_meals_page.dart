import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsPage extends StatelessWidget {
  final String id, title;

  const CategoryMealsPage({Key key, this.id, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meals =
        DUMMY_MEALS.where((meal) => meal.categories.contains(id)).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 25.0),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15.0),
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 4 / 3,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
          maxCrossAxisExtent: 400,
        ),
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(meal: meals[index]),
      ),
    );
  }
}
