import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/screens/Categories_screen.dart';
import 'package:jordantimes_final/screens/CompanyHistory.dart';
import 'package:jordantimes_final/screens/Company_Notifications.dart';
import 'package:jordantimes_final/screens/Goverment_History.dart';
import 'package:jordantimes_final/screens/Goverment_Notifications_screen.dart';
import 'package:jordantimes_final/screens/Locations_screen.dart';
import 'package:jordantimes_final/screens/Rejected_companies.dart';
import 'package:jordantimes_final/screens/category_trips_screen.dart';
import 'package:jordantimes_final/screens/edit_profile.dart';
import 'package:jordantimes_final/screens/tabs_screen.dart';
import 'package:jordantimes_final/screens/trip_ditail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      routes: {
        '/': (context) => TabScreen(),
        '/category-trips': (context) => CategoryTripsScreen(),
        '/trip-detail': (context) => TripDetailScreen(),
        'CompanyHistory' : (context) => CompanyHistory(),
        'edit_profile' : (context) => editProfile(),
        'Company_Notifications' : (context) => CompanyNotifications(),
         'Goverment_History':(context) => GovermentHistory(),
         'Goverment_Notifications': (context) => GovermentNotifications(),
         'Rejected_companies' : (context) => RejectedCompanies(),
         'Locations_screen' : (context) => LocationsScreen(),
      },
    );
  }
}
