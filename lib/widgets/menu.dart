import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Cooking Up!'),
            accountEmail: Text(''),
            arrowColor: Colors.amberAccent,
            currentAccountPicture: Icon(
              Icons.food_bank_rounded,
              size: 60.0,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
          ),
          buildTile(
            Icons.restaurant_menu_rounded,
            'Meals',
            () => Navigator.of(context).pop(),
          ),
          buildTile(
            Icons.filter_alt_rounded,
            'Filters',
            () {},
          ),
        ],
      ),
    );
  }

  ListTile buildTile(IconData icon, String label, Function onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      onTap: onTap,
    );
  }
}
