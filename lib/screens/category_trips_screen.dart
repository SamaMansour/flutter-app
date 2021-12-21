import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:jordantimes_final/Widgets/filter_drawer.dart';
import 'package:jordantimes_final/Widgets/trip_item.dart';
import 'package:jordantimes_final/screens/filter_screen.dart';
import '../Widgets/app_data.dart';

class CategoryTripsScreen extends StatefulWidget {
  @override
  _CategoryTripsScreenState createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  final _auth = FirebaseAuth.instance;

  final _firestore = FirebaseFirestore.instance;

  var tripid = "";
  int price = 0;
  int price2 = 0;
  var newprice = "";

  String dropdownvalue = '1 Passenger';
  int noOfPassengers = 1;
  String period = " ";
  DateTimeRange? myDateRange;
  var items = [
    '1 Passenger',
    '2 Passengers',
    '3 Passengers',
    '4 Passengers',
    '5 Passengers',
    '6 Passengers'
  ];

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
      appBar: AppBar(
        title: Text(categoryTitle!),
        actions: <Widget>[],
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('added').snapshots(),
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
                      final booked = company.get('booked');
                      //int periodTime = int.parse(widget.period) ;
                      //int noPass = int.parse(widget.noOfPassengers) ;
                      //price = price *periodTime*noPass;

                      final companyWidget = Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            SizedBox(height: 8.0),
                            Center(
                              child: Container(
                                width: 300.0,
                                height: 70.0,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      value: dropdownvalue,
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      items: items.map((String items) {
                                        return DropdownMenuItem(
                                            value: items, child: Text(items));
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          dropdownvalue = newValue.toString();
                                        });

                                        if (dropdownvalue == "1 Passenger") {
                                          noOfPassengers = 1;
                                        } else if (dropdownvalue ==
                                            "2 Passenggers") {
                                          noOfPassengers = 2;
                                        } else if (dropdownvalue ==
                                            "3 Passengers") {
                                          noOfPassengers = 3;
                                        } else if (dropdownvalue ==
                                            "4 Passengers") {
                                          noOfPassengers = 4;
                                        } else if (dropdownvalue ==
                                            "5 Passengers") {
                                          noOfPassengers = 5;
                                        } else if (dropdownvalue ==
                                            "6 Passengers") {
                                          noOfPassengers = 6;
                                        }
                                      }),
                                ),
                              ),
                            ),
                            DateRangeField(
                                enabled: true,
                                initialValue: DateTimeRange(
                                    start: DateTime.now(),
                                    end: DateTime.now().add(Duration(days: 5))),
                                decoration: InputDecoration(
                                  labelText: 'Duration',
                                  prefixIcon: Icon(Icons.date_range),
                                  hintText:
                                      'Please select a start and end date',
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) {
                                  myDateRange = value!;
                                  period = (myDateRange!.end.day -
                                          myDateRange!.start.day)
                                      .toString();
                                }),
                            SizedBox(height: 8),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              child: Material(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)),
                                elevation: 5.0,
                                child: MaterialButton(
                                    minWidth: 400.0,
                                    height: 42.0,
                                    child: Text('Apply Filter'),
                                    onPressed: () async {
                                      print(noOfPassengers);
                                      print(period);
                                      final pass = noOfPassengers.toString();
                                     setState(() {
                                        price2 = int.parse(price) *
                                          noOfPassengers *
                                          int.parse(period);
                                     });
                                     
                                    }),
                              ),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                  backgroundImage: NetworkImage(img)),
                              title:
                                  Text(title, style: TextStyle(fontSize: 20)),
                              subtitle: Text(
                                price2.toString() +
                                    'JD' +
                                    ' ' +
                                    ' ' +
                                    'Offered by '+
                                    email,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.9)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
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
                                    date +
                                    '\n' +
                                    'Booked' +
                                    booked,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () async {
                                    Navigator.of(context).pushNamed(
                                        'reservation_details',
                                        arguments: ScreenArguments(id));
                                  },
                                  child: const Text('Select '),
                                ),
                              ],
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



class ScreenArguments {
  final String id;

  ScreenArguments(this.id);
}

class ScreenViewArguments {
  final String id;
  final String price;

  ScreenViewArguments(this.id, this.price);
}
