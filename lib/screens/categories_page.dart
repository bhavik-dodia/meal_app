import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widgets/category_item.dart';
import 'category_meals_page.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(10.0),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        maxCrossAxisExtent: 200,
      ),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => OpenContainer(
              closedElevation: 0.0,
              openColor: Theme.of(context).canvasColor,
              transitionType: ContainerTransitionType.fadeThrough,
              transitionDuration: const Duration(milliseconds: 300),
              closedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              openBuilder: (contex, closeContainer) => CategoryMealsPage(
                id: catData.id,
                title: catData.title,
                closeContainer: closeContainer,
              ),
              closedBuilder: (contex, openContainer) => CategoryItem(
                title: catData.title,
                color: catData.color,
                openContainer: openContainer,
              ),
            ),
          )
          .toList(),
    );
  }
}
