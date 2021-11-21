import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:jordantimes_final/Widgets/filter_drawer.dart';
import 'package:jordantimes_final/Widgets/trip_item.dart';
import '../Widgets/app_data.dart';

class CategoryTripsScreen extends StatelessWidget {
  final int noOfPassengers;
  final int period;

  CategoryTripsScreen(this.noOfPassengers, this.period);
  final _firestore = FirebaseFirestore.instance;

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
      drawer: FilterDrawer(),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('trips').snapshots(),
              builder: (context, snapshot) {
                List<Card> companiesWidgets = [];
                if (!snapshot.hasData) {
                  return CircularProgressIndicator(
                    backgroundColor: Colors.red,
                  );
                }

                final companies = snapshot.data!.docs;
                for (var company in companies) {
                  final locations_to = company.get('locations_to');
                  for (var x in locations_to) {
                    if (x == categoryTitle) {
                      final email = company.get('email');
                      final id = company.get('id');
                      final title = company.get('title');
                      final description = company.get('description');
                      var price = company.get('price');
                      final img = company.get('img');
                      final img2 = company.get('img2');
                      final img3 = company.get('img3');
                      final date = company.get('date');
                      final locations_from = company.get('locations_from');
                      final locations_to = company.get('locations_to');
                      final meals = company.get('meals');

                      price = price * noOfPassengers * period;

                      final companyWidget = Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                  backgroundImage: NetworkImage(img)),
                              title: Text(title),
                              subtitle: Text(
                                price + 'JD' + ' ' + ' ' + 'Offered by ',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                description +
                                    '\n' +
                                    ' locations from' +
                                    locations_from.toString() +
                                    ' to ' +
                                    locations_to.toString() +
                                    '\n' +
                                    'Meals' +
                                    meals.toString() +
                                    ' \n' +
                                    'Days' +
                                    date,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            ImageSlideshow(
                              /// Width of the [ImageSlideshow].
                              width: double.infinity,

                              /// Height of the [ImageSlideshow].
                              height: 200,

                              /// The page to show when first creating the [ImageSlideshow].
                              initialPage: 0,

                              /// The color to paint the indicator.
                              indicatorColor: Colors.blue,

                              /// The color to paint behind th indicator.
                              indicatorBackgroundColor: Colors.grey,

                              /// The widgets to display in the [ImageSlideshow].
                              /// Add the sample image file into the images folder
                              children: [
                                Image.network(img),
                                Image.network(img2),
                                Image.network(img3),
                              ],

                              /// Called whenever the page in the center of the viewport changes.
                              onPageChanged: (value) {
                                print('Page changed: $value');
                              },

                              /// Auto scroll interval.
                              /// Do not auto scroll with null or 0.
                              autoPlayInterval: 3000,

                              /// Loops back to first slide.
                              isLoop: true,
                            ),
                          ],
                        ),
                      );

                      companiesWidgets.add(companyWidget);
                    }
                  }
                  //Stream Data from Database
                }

                return Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 24),
                    children: companiesWidgets,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
