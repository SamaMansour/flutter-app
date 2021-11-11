import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/Widgets/trip_item.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';
import 'package:jordantimes_final/screens/edit_trip.dart';

class CompanyHistory extends StatefulWidget {
  @override
  _CompanyHistoryState createState() => _CompanyHistoryState();
}

class _CompanyHistoryState extends State<CompanyHistory> {
  final List<Map<String, dynamic>> _alltrips = [];
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

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
      appBar: AppBar(
        title: Text('History'),
      ),
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
                    _alltrips.add({"email":email,"id":id,"title": title, "description": description, "price": price, "seats": seats, "img": img});
                    

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
                          Image.network(img),
                        ],
                      ),
                    );
                    //Stream Data from Database
                    
                  }

                 

                  return Expanded(
                   child: _foundTrips.isNotEmpty &&  _foundTrips[0]['email'] == _auth.currentUser!.email
                  ? ListView.builder(
                      itemCount: _foundTrips.length,
                      itemBuilder: (context, index) => Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                                backgroundImage: NetworkImage(_foundTrips[index]['img'].toString())),
                            title: Text(_foundTrips[index]['title']),
                            subtitle: Text(
                              _foundTrips[index]['price']+ 'JD' + ' ' + ' ' + 'Offered by ' + _foundTrips[index]['email'],
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                             _foundTrips[index]['description'] +
                                  '\n' +
                                  'Number of seats' +
                                  _foundTrips[index]['seats'].toString(),
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
                                  print(_foundTrips[index]['id']);
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                          builder: (context) => EditTrip(
                                                _foundTrips[index]['id'],
                                              )));
                                },
                                child: const Text('Edit'),
                              ),
                              FlatButton(
                                textColor: Colors.red,
                                onPressed: () async {
                                  print(_foundTrips[index]['id']);
                                  await _firestore
                                      .collection('trips')
                                      .doc(_foundTrips[index]['id'])
                                      .delete();
                                },
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                          Image.network(_foundTrips[index]['img']),
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
}
