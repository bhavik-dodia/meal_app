import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/filters.dart';
import '../widgets/meal_item.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FilteredMeal>(
      builder: (context, favorites, child) => favorites.favoriteMealsLength == 0
          ? Center(
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      'images/no_favorites.png',
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  const Text(
                    'Your favorite meals will be available here as soon as you mark them as favorites.',
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                  const SizedBox(height: 15.0),
                ],
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(15.0),
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 4 / 3,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                maxCrossAxisExtent: 400,
              ),
              itemCount: favorites.favoriteMealsLength,
              itemBuilder: (context, index) =>
                  MealItem(meal: favorites.favoriteMeals[index]),
            ),
    );
  }
}
