import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../data/dummy_data.dart';
import 'meal.dart';

class FilteredMeal extends ChangeNotifier {
  List<Meal> _filteredMeals = DUMMY_MEALS;

  UnmodifiableListView get filteredMeals =>
      UnmodifiableListView(_filteredMeals);

  void filter(Map<String, bool> filters) {
    _filteredMeals = DUMMY_MEALS.where((meal) {
      if (filters['Gluten-free'] && !meal.isGlutenFree) return false;
      if (filters['Lactose-free'] && !meal.isLactoseFree) return false;
      if (filters['Vegan'] && !meal.isVegan) return false;
      if (filters['Vegetarian'] && !meal.isVegetarian) return false;
      return true;
    }).toList();
    notifyListeners();
  }
}
