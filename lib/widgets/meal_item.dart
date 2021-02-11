import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/filters.dart';
import '../models/meal.dart';
import '../screens/meal_details_page.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({
    Key key,
    @required this.meal,
  }) : super(key: key);

  void selectMeal(BuildContext context) => Navigator.of(context).pushNamed(
        MealDetailsPage.routeName,
        arguments: meal,
      );

  String get complexityText {
    switch (meal.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (meal.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  build(BuildContext context) {
    final theme = Theme.of(context);
    final isLight = theme.brightness == Brightness.light;
    return Card(
      elevation: 8.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: () => selectMeal(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Card(
                    elevation: 0.0,
                    margin: EdgeInsets.zero,
                    clipBehavior: Clip.antiAlias,
                    color: Colors.transparent,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(60.0),
                      ),
                    ),
                    child: Image.network(
                      meal.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          isLight ? Colors.white : theme.canvasColor,
                        ],
                        stops: [0, 1],
                      ),
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        color: isLight ? Colors.black : Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    constraints:
                        const BoxConstraints(minHeight: 20.0, minWidth: 20.0),
                    tooltip: 'Add to favorites',
                    icon: Icon(
                      meal.isFavorite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                    ),
                    color: Colors.redAccent,
                    onPressed: () =>
                        Provider.of<FilteredMeal>(context, listen: false)
                            .toggleFavorite(meal),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.timer_rounded),
                      const SizedBox(width: 5.0),
                      Text('${meal.duration} min', overflow: TextOverflow.fade),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.work_outline_rounded),
                      const SizedBox(width: 5.0),
                      Text(complexityText, overflow: TextOverflow.fade),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.attach_money_rounded),
                      const SizedBox(width: 5.0),
                      Text(affordabilityText, overflow: TextOverflow.fade),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
