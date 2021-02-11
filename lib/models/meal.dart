import 'package:flutter/foundation.dart';

class Meal {
  final int duration;
  final List categories, ingredients, steps;
  final String id, title, imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree, isLactoseFree, isVegan, isVegetarian;
  bool isFavorite;

  Meal({
    @required this.id,
    @required this.duration,
    @required this.categories,
    @required this.ingredients,
    @required this.steps,
    @required this.title,
    @required this.imageUrl,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    this.isFavorite: false,
  });

  void toggleFavorite() => isFavorite = !isFavorite;
}

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}
