import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:jordantimes_final/screens/Admin_Notifications.dart';
import 'package:jordantimes_final/screens/Admin_screen.dart';
import 'package:jordantimes_final/screens/Categories_screen.dart';
import 'package:jordantimes_final/screens/Column_User_chart.dart';
import 'package:jordantimes_final/screens/CompanyHistory.dart';

import 'package:jordantimes_final/screens/ForgotPassword_screen.dart';
import 'package:jordantimes_final/screens/Goverment_History.dart';
import 'package:jordantimes_final/screens/Goverment_Notifications_screen.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';
import 'package:jordantimes_final/screens/Locations_screen.dart';
import 'package:jordantimes_final/screens/Rejected_companies.dart';
import 'package:jordantimes_final/screens/User_chart_screen.dart';
import 'package:jordantimes_final/screens/category_trips_screen.dart';
import 'package:jordantimes_final/screens/contactus.dart';
import 'package:jordantimes_final/screens/currency_converter.dart';
import 'package:jordantimes_final/screens/edit_profile.dart';
import 'package:jordantimes_final/screens/edit_profile_user.dart';
import 'package:jordantimes_final/screens/favorite_screen.dart';
import 'package:jordantimes_final/screens/filter_screen.dart';
import 'package:jordantimes_final/screens/payment_screen.dart';
import 'package:jordantimes_final/screens/posts_screen.dart';
import 'package:jordantimes_final/screens/profile_info.dart';
import 'package:jordantimes_final/screens/reservation_details.dart';
import 'package:jordantimes_final/screens/tabs_screen.dart';
import 'package:jordantimes_final/screens/trip_ditail_screen.dart';
import 'package:jordantimes_final/screens/user_trips.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'AR')],
        path: 'assets/lang', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  FirebaseAnalytics analytics = FirebaseAnalytics();
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    String period = " ";
    String noOfPassengers = " ";
    final String apiKey = "AIzaSyDSotvProLu8FZSmGssd7PNjhbggSq_48I";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JordanTimes',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      //home: Categoriesscreen(),
      //initialRoute: '/',
      routes: {
        '/': (context) => TabScreen(),
        '/category-trips': (context) => CategoryTripsScreen(),
        '/trip-detail': (context) => TripDetailScreen(),
        'CompanyHistory': (context) => CompanyHistory(),
        'edit_profile': (context) => editProfile(),
        'Goverment_History': (context) => GovermentHistory(),
        'Goverment_Notifications': (context) => GovermentNotifications(),
        'Rejected_companies': (context) => RejectedCompanies(),
        'Locations_screen': (context) => LocationsScreen(),
        'User_chart_screen': (context) => UserChart(),
        'Admin_screen': (context) => AdminScreen(),
        'profile_info': (context) => ProfileInfo(),
        'category_trips_screen': (context) => CategoryTripsScreen(),
        'filter_screen': (context) => FilterScreen(),
        'reservation_details': (context) => ReservationDetails(),
        'Goverment_screen': (context) => GovermentScreen(),
        'Column_User_Chart': (context) => ColumnUserChart(),
        'favorite_screen': (context) => favoriteScreen(),
        'contactus': (context) => ContactusScreen(),
        'user_trips': (context) => UserTrips(),
        'payment_screen': (context) => PaymentScreen(),
        'ForgotPassword_screen': (context) => ForgotPassword(),
        'edit_profile_user': (context) => editProfileUser(),
        'currency_converter': (context) => CurrencyConverter()
      },
    );
  }
}
