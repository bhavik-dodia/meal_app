import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/filters.dart';

class FiltersChips extends StatefulWidget {
  @override
  _FiltersChipsState createState() => _FiltersChipsState();
}

class _FiltersChipsState extends State<FiltersChips> {
  Map<String, bool> _filterData = {
    'Gluten-free': false,
    'Lactose-free': false,
    'Vegan': false,
    'Vegetarian': false,
  };

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          buildChip('Gluten-free'),
          const SizedBox(width: 15.0),
          buildChip('Lactose-free'),
          const SizedBox(width: 15.0),
          buildChip('Vegan'),
          const SizedBox(width: 15.0),
          buildChip('Vegetarian'),
        ],
      ),
    );
  }

  Widget buildChip(String label) {
    final theme = Theme.of(context);
    return FilterChip(
      elevation: 5.0,
      pressElevation: 0.0,
      labelStyle: TextStyle(color: theme.accentColor),
      checkmarkColor: theme.accentColor,
      clipBehavior: Clip.antiAlias,
      selected: _filterData[label],
      selectedColor: theme.accentColor.withOpacity(0.3),
      selectedShadowColor: theme.accentColor,
      shape: StadiumBorder(
        side: BorderSide(color: theme.accentColor.withOpacity(0.5)),
      ),
      label: Text(label),
      onSelected: (newValue) {
        setState(() => _filterData[label] = newValue);
        Provider.of<FilteredMeal>(context, listen: false).filter(_filterData);
      },
    );
  }
}
