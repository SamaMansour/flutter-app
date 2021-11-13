import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class postsScreen extends StatefulWidget {
  @override
  _postsScreenState createState() => _postsScreenState();
}

class _postsScreenState extends State<postsScreen> {
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
                    final seats = company.get('seats');
                    final img = company.get('img');
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
                      "seats": seats,
                      "img": img,
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
                                  'Number of seats' +
                                  seats.toString(),
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
                                 

                      _firestore.collection('reported').doc(id).set({
                      'id ': id,
                      'title ': title,
                      'description':description,
                      'reported': "reported",
                      
                    });
                                },
                                child: const Text('Report'),
                              ),
                              FlatButton(
                                textColor: Colors.red,
                                onPressed: () async {
                                  print(id);
                                },
                                child: const Text('Add'),
                              ),
                            ],
                          ),
                          Image.network(img),
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

                  
                }
                
                
                )
          ],
        ),
      ),
    );
  }


  
}
