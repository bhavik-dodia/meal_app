import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final Function openContainer;

  const CategoryItem({Key key, this.title, this.color, this.openContainer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: openContainer,
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color: color),
      ),
      focusElevation: 0.0,
      hoverElevation: 0.0,
      disabledElevation: 0.0,
      highlightElevation: 0.0,
      elevation: 0.0,
      textColor: color,
      color: color.withOpacity(0.3),
      splashColor: color.withOpacity(0.4),
      hoverColor: color.withOpacity(0.5),
    );
  }
}
