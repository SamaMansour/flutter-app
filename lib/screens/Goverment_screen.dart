import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/Widgets/app_drawer.dart';
import 'package:jordantimes_final/screens/Categories_screen.dart';
import 'package:jordantimes_final/screens/Search_Screen.dart';
import 'package:jordantimes_final/screens/favorite_screen.dart';
import 'package:jordantimes_final/screens/tabs_screen.dart';
import 'package:jordantimes_final/screens/welcome_screen.dart';

class GovermentScreen extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  TextEditingController _searchController = TextEditingController();
  

  void messagesStream() async {
    await for (var snapshot in _firestore.collection('users').snapshots()) {
      for (var company in snapshot.docs) {
        print(company.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Query (
  String field, {
  dynamic isEqualTo,
  dynamic isLessThan,
  dynamic isLessThanOrEqualTo,
  dynamic isGreaterThan,
  dynamic isGreaterThanOrEqualTo,
  dynamic arrayContains,

}){
}
    return Scaffold(
      appBar: AppBar(
        title: Text('MOTA'),
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('users').snapshots(),
                builder: (context, snapshot) {
                  List<ItemLine> companiesWidgets = [];
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    );
                  }

                  final companies = snapshot.data!.docs;
                  for (var company in companies) {
                    if (company.get('role') == "company") {
                      final id = company.get('id');
                      final no = company.get('number');
                      final name = company.get('name');
                      final phone = company.get('phone');
                      final email = company.get('email');

                      final companyWidget = ItemLine(
                        no: no,
                        name: name,
                        phone: phone,
                        email: email,
                      );

                      companiesWidgets.add(companyWidget);
                    }
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

class ItemLine extends StatelessWidget {
  TextEditingController customController = TextEditingController();
  var pressedValue = false;
  final _firestore = FirebaseFirestore.instance;
  ItemLine(
      {this.no,
      this.name,
      this.phone,
      this.email,
      Key? key,
      status,
      title,
      description,
      price, bio, img})
      : super(key: key);

  String? no;
  String? name;
  String? phone;
  String? email;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Material(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 0),
              child: Text(
                '$no \t $name \t  ',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 6,
        ),
        TextButton(
            onPressed: () async {
              _firestore.collection('accepted').doc(email).set({
                'name': name,
                'number': no,
                'phone': phone,
                'email': email,
                'role': "company",
                'verfied': "accepted",
              });
              pressedValue = true;
            },
            child: Text('Accept')),
        SizedBox(
          width: 6,
        ),
        TextButton(
            onPressed: () {
              if (pressedValue == false) {
               
                pressedValue = true;
                createAlertDialog(context);
              }
            },
            child: Text('Decline')),
      ]),
    );
  }

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Your Feedback'),
            content: TextField(
              controller: customController,
            ),
            actions: <Widget>[
              MaterialButton(
                  child: Text('Submit'),
                  onPressed: () {
                    _firestore.collection('declined').doc(email).set({
                      'name': name,
                      'number': no,
                      'phone': phone,
                      'role': "company",
                      'verfied': "declined",
                      'reason': customController.text,
                    });
                  })
            ],
          );
        });
  }
}
