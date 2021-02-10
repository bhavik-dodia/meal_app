import 'dart:ui';

import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailsPage extends StatelessWidget {
  static const routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final meal = ModalRoute.of(context).settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: theme.canvasColor,
        iconTheme: IconThemeData(color: theme.accentColor),
        centerTitle: true,
        title: Text(
          meal.title,
          style: TextStyle(
            fontSize: 25.0,
            color: theme.accentColor,
          ),
        ),
      ),
      body: MediaQuery.of(context).orientation == Orientation.portrait
          ? Column(
              children: [
                buildImage(16 / 9, meal.imageUrl),
                buildDetails(context, meal),
              ],
            )
          : Row(
              children: [
                buildImage(1, meal.imageUrl),
                buildDetails(context, meal),
              ],
            ),
    );
  }

  Widget buildImage(double aspectRatio, String imgUrl) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Image.network(
        imgUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildDetails(BuildContext context, Meal meal) {
    return Expanded(
      child: ListView(
        children: [
          const SizedBox(height: 5.0),
          buildSectionTitle(context, 'Ingredients'),
          buildContainer(
            ListView.separated(
              itemCount: meal.ingredients.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(meal.ingredients[index]),
              ),
              separatorBuilder: (context, index) => Divider(
                endIndent: 20.0,
                indent: 20.0,
              ),
            ),
          ),
          buildSectionTitle(context, 'Steps'),
          buildContainer(
            ListView.separated(
              itemCount: meal.steps.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(
                  meal.steps[index],
                  textAlign: TextAlign.justify,
                ),
              ),
              separatorBuilder: (context, index) => Divider(
                endIndent: 20.0,
                indent: 20.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      height: 150.0,
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.blueAccent),
      ),
      child: child,
    );
  }

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
