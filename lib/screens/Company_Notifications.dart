import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jordantimes_final/Widgets/trip_item.dart';
import 'package:jordantimes_final/Widgets/user_drawer.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';
import 'package:jordantimes_final/screens/edit_trip.dart';

class CompanyNotifications extends StatefulWidget {
  @override
  _CompanyNotificationsState createState() => _CompanyNotificationsState();
}

class _CompanyNotificationsState extends State<CompanyNotifications> {
  final List<Map<String, dynamic>> _alltrips = [];
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String loggedName = " ";
  var id = " ";

  List<Map<String, dynamic>> _foundTrips = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundTrips = _alltrips;

    getName();

    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _alltrips;
    } else {
      results = _alltrips
          .where((trip) =>
              trip["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
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
      appBar: AppBar(
        title: Text('Profile'),
      ),
      drawer: UserDrawer(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('members').snapshots(),
                builder: (context, snapshot) {
                  List<Card> companiesWidgets = [];
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    );
                  }
                  var name = FirebaseFirestore.instance
                      .collection('indicies')
                      .doc(_auth.currentUser!.email);
                  final username = name.get();

                  final companies = snapshot.data!.docs;
                  for (var company in companies) {
                     id = company.get('id');
                    final email = company.get('email');
                    final phone = company.get('phone');
                    final name = company.get('name');
                    final age = company.get('age');
                    final nationalId = company.get('nationalId');
                    final name1 = company.get('name 1');
                    final age1 = company.get('age 1');
                    final nationalId1 = company.get('nationalId 1');
                    final name2 = company.get('name 2');
                    final age2 = company.get('age 2');
                    final nationalId2 = company.get('nationalId 2');
                    final name3 = company.get('name 3');
                    final age3 = company.get('age 3');
                    final nationalId3 = company.get('nationalId 3');
                    final name4 = company.get('name 4');
                    final age4 = company.get('age 4');
                    final nationalId4 = company.get('nationalId 4');
                    final name5 = company.get('name 5');
                    final age5 = company.get('age 5');
                    final nationalId5 = company.get('nationalId 5');
                    final name6 = company.get('name 6');
                    final age6 = company.get('age 6');
                    final nationalId6 = company.get('nationalId 6');
                    _alltrips.add({
                      "id": id,
                      "name": name,
                      "email": email,
                      "age": age,
                      "phone": phone,
                      "nationalId": nationalId,
                      "name1": name1,
                      "age1": age1,
                      "nationalId1": nationalId1,
                      "name2": name2,
                      "age2": age2,
                      "nationalId2": nationalId2,
                      "name3": name3,
                      "age3": age3,
                      "nationalId3": nationalId3,
                      "name4": name4,
                      "age4": age4,
                      "nationalId4": nationalId4,
                      "name5": name5,
                      "age5": age5,
                      "nationalId5": nationalId5,
                      "name6": name6,
                      "age6": age6,
                      "nationalId6": nationalId6
                    });

                    final companyWidget = Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              name,
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
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (context) => EditTrip(
                                                id,
                                              )));
                                },
                                child: const Text('Edit'),
                              ),
                              FlatButton(
                                textColor: Colors.red,
                                onPressed: () async {
                                  print(id);
                                  await _firestore
                                      .collection('trips')
                                      .doc(id)
                                      .delete();
                                },
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                          Image.network(''),
                        ],
                      ),
                    );
                    //Stream Data from Database

                  }

                  return Expanded(
                    child: _foundTrips.isNotEmpty 
                        ? ListView.builder(
                            itemCount: _foundTrips.length,
                            itemBuilder: (context, index) => Card(
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(_foundTrips[index]['id']),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      _foundTrips[index]['name'] + 'whose age:'
                                          '\n' +
                                          _foundTrips[index]['age'] + 
                                          'and phone number:'
                                          +'\n'+
                                          _foundTrips[index]['phone'] +
                                          '\n' +
                                          'and nationalId'+
                                          _foundTrips[index]['nationalId'] +
                                          '\n'+ 'booked with'+
                                          '\n' +
                                          _foundTrips[index]['name1'] +
                                          ' ' +
                                          _foundTrips[index]['age1'] +
                                          ' ' +
                                          _foundTrips[index]['nationalId1'] +
                                          '\n' +
                                          _foundTrips[index]['name2'] +
                                          ' ' +
                                          _foundTrips[index]['age2'] +
                                          ' ' +
                                          _foundTrips[index]['nationalId2'] +
                                          '\n' +
                                          _foundTrips[index]['name3'] +
                                          ' ' +
                                          _foundTrips[index]['age3'] +
                                          ' ' +
                                          _foundTrips[index]['nationalId3'] +
                                          '\n' +
                                          _foundTrips[index]['name4'] +
                                          ' ' +
                                          _foundTrips[index]['age4'] +
                                          ' ' +
                                          _foundTrips[index]['nationalId4'] +
                                          '\n' +
                                          _foundTrips[index]['name5'] +
                                          ' ' +
                                          _foundTrips[index]['age5'] +
                                          ' ' +
                                          _foundTrips[index]['nationalId5'] +
                                          '\n' +
                                          _foundTrips[index]['name6'] +
                                          ' ' +
                                          _foundTrips[index]['age6'] +
                                          ' ' +
                                          _foundTrips[index]['nationalId6'],
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6)),
                                    ),
                                  ),
                                

                                  /*Image.network(_foundTrips[index]['img']),
                                  Image.network(_foundTrips[index]['img2']),
                                  Image.network(_foundTrips[index]['img3']),*/
                                ],
                              ),
                            ),
                          )
                        : const Text(
                            'No results found',
                            style: TextStyle(fontSize: 24),
                          ),
                  );
                })
          ],
        ),
      ),
    );
  }

  Future<void> getName() async {
    await for (var snapshot in _firestore.collection('indicies').snapshots()) {
      for (var savedUser in snapshot.docs) {
        if (savedUser.get('email') as String ==
            _auth.currentUser!.email as String) {
          loggedName = savedUser.get('name') as String;
          print(loggedName);
          setState(() => loggedName = loggedName);
        }
      }
    }
  }

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Your Feedback'),
            content: RatingBar.builder(
              initialRating: 3,
              itemCount: 5,
              itemBuilder: (context, index) {
                switch (index) {
                  case 0:
                    return Icon(
                      Icons.sentiment_very_dissatisfied,
                      color: Colors.red,
                    );
                  case 1:
                    return Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.redAccent,
                    );
                  case 2:
                    return Icon(
                      Icons.sentiment_neutral,
                      color: Colors.amber,
                    );
                  case 3:
                    return Icon(
                      Icons.sentiment_satisfied,
                      color: Colors.lightGreen,
                    );
                  case 4:
                    return Icon(
                      Icons.sentiment_very_satisfied,
                      color: Colors.green,
                    );
                }
                return Icon(Icons.star);
              },
              onRatingUpdate: (rating) {
                print(rating);
                FirebaseFirestore.instance.collection('trips').doc(id).update(
                  {
                    'rate':rating,
                  }
                );
              },
            ),
          );
        });
  }
}
