import 'package:flutter/material.dart';
import 'package:meals_app/models/filters.dart';
import 'package:provider/provider.dart';

import '../widgets/meal_item.dart';

class CategoryMealsPage extends StatefulWidget {
  final String id, title;
  final Function closeContainer;

  const CategoryMealsPage({Key key, this.id, this.title, this.closeContainer})
      : super(key: key);

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final meals = Provider.of<FilteredMeal>(context)
        .filteredMeals
        .where((meal) => meal.categories.contains(widget.id))
        .toList();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: theme.canvasColor,
        iconTheme: IconThemeData(color: theme.accentColor),
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 25.0, color: theme.accentColor),
        ),
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
