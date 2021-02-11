import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'models/filters.dart';
import 'screens/home_page.dart';
import 'screens/meal_details_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FilteredMeal(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meals',
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
          accentColor: Colors.blueAccent,
          textTheme: GoogleFonts.poppinsTextTheme(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.blueAccent,
          accentColor: Colors.blueAccent,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme.apply(
                  bodyColor: Colors.white,
                  displayColor: Colors.white,
                ),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
        routes: {MealDetailsPage.routeName: (context) => MealDetailsPage()},
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      ),
    );
  }
}
