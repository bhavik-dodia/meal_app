import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../data/dummy_data.dart';
import 'meal.dart';

class FilteredMeal extends ChangeNotifier {
  List<Meal> _filteredMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];

  UnmodifiableListView get filteredMeals =>
      UnmodifiableListView(_filteredMeals);

  UnmodifiableListView get favoriteMeals =>
      UnmodifiableListView(_favoriteMeals);

  int get favoriteMealsLength => _favoriteMeals.length;

  void filter(Map<String, bool> filters) {
    _filteredMeals = dummyMeals.where((meal) {
      if (filters['Gluten-free'] && !meal.isGlutenFree) return false;
      if (filters['Lactose-free'] && !meal.isLactoseFree) return false;
      if (filters['Vegan'] && !meal.isVegan) return false;
      if (filters['Vegetarian'] && !meal.isVegetarian) return false;
      return true;
    }).toList();
    notifyListeners();
  }

  void toggleFavorite(Meal meal) {
    meal.toggleFavorite();
    if (meal.isFavorite)
      _favoriteMeals.add(meal);
    else
      _favoriteMeals.remove(meal);
    notifyListeners();
  }
}
