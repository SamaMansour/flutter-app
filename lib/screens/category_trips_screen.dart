import 'package:flutter/material.dart';
import 'package:jordantimes_final/Widgets/trip_item.dart';
import '../Widgets/app_data.dart';

class CategoryTripsScreen extends StatelessWidget {
  
  //final String categoryId;
  //final String categoryTitle;

  //CategoryTripsScreen( this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArgument['id'];
    final categoryTitle = routeArgument['title'];
    final filteredTrips = Trips_data.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();

    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle!)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return TripItem(
              id: filteredTrips[index].id,
              title: filteredTrips[index].title,
              imageUrl: filteredTrips[index].imageUrl,
              duration: filteredTrips[index].duration,
              tripType: filteredTrips[index].tripType,
              price: filteredTrips[index].price,
            );
          },
          itemCount: filteredTrips.length,
        ));
  }
}
