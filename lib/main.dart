import 'package:flutter/material.dart';
import 'package:jordantimes_final/screens/Categories_screen.dart';
import 'package:jordantimes_final/screens/category_trips_screen.dart';
import 'package:jordantimes_final/screens/tabs_screen.dart';
import 'package:jordantimes_final/screens/trip_ditail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget { 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JordanTimes',
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      //home: Categoriesscreen(),
      //initialRoute: '/',
      routes:{
        '/' : (context) =>TabScreen(),
       '/category-trips':(context) => CategoryTripsScreen(),
       '/trip-detail' : (context) => TripDetailScreen(),

      },
    );
  }
}

