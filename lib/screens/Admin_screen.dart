import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:jordantimes_final/Widgets/admin_drawer.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final List<Map<String, dynamic>> _alltrips = [];
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  TextEditingController customController = TextEditingController();

  List<Map<String, dynamic>> _foundTrips = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundTrips = _alltrips;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _alltrips;
    } else {
      results = _alltrips
          .where((user) => user["title"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundTrips = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      drawer: AdminDrawer(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
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
                    final email = company.get('email');
                    final id = company.get('id');
                    final title = company.get('title');
                    final description = company.get('description');
                    final price = company.get('price');
                    final img = company.get('img');
                    final img2 = company.get('img2');
                    final img3 = company.get('img3');
                    final date = company.get('date');
                    final locations_from = company.get('locations_from');
                    final locations_to = company.get('locations_to');
                    final meals = company.get('meals');
                    _alltrips.add({
                      "email": email,
                      "id": id,
                      "title": title,
                      "description": description,
                      "price": price,
                      "img": img,
                      "img2": img2,
                      "img3": img3,
                      "date": date,
                      "locations_from": locations_from,
                      "locations_to": locations_to,
                      "meals": meals
                    });

                    final companyWidget = Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                                backgroundImage: NetworkImage(img)),
                            title: Text(title),
                            subtitle: Text(
                              price + 'JD' + ' ' + ' ' + 'Offered by ' + email,
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
                          ButtonBar(
                            alignment: MainAxisAlignment.start,
                            children: [
                              FlatButton(
                                textColor: Colors.red,
                                onPressed: () {
                                  print(id);

                                  _firestore
                                      .collection('reported')
                                      .doc(id)
                                      .set({
                                    'id ': id,
                                    'title ': title,
                                    'description': description,
                                    'email' : email,
                                    'reported': "reported",
                                  });
                                },
                                child: const Text('Report'),
                              ),
                              FlatButton(
                                textColor: Colors.red,
                                onPressed: () async {
                                  _firestore.collection('added').doc(id).set({
                                    "email": email,
                                    "id": id,
                                    "title": title,
                                    "description": description,
                                    "price": price,
                                    "img": img,
                                    "img2" :img2,
                                    "img3" :img3,
                                    "date": date,
                                    "locations_from": locations_from,
                                    "locations_to": locations_to,
                                    "meals": meals
                                  });
                                },
                                child: const Text('Add'),
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

                    //Stream Data from Database

                  }
                  return Expanded(
                    child: ListView(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 24),
                      children: companiesWidgets,
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
