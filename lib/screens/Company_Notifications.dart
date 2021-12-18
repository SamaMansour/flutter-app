import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/Widgets/history_drawer.dart';

import 'package:jordantimes_final/screens/Goverment_screen.dart';

class CompanyNotifications extends StatefulWidget {
  const CompanyNotifications({Key? key}) : super(key: key);

  @override
  _CompanyNotificationsState createState() => _CompanyNotificationsState();
}

class _CompanyNotificationsState extends State<CompanyNotifications> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  final List<Map<String, dynamic>> _allCompanies = [];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      drawer: HistoryDrawer(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('reported').snapshots(),
                builder: (context, snapshot) {
                  List<ItemLineOne> companiesWidgets = [];
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    );
                  }
                  //Stream Companies from Database

                  final companies = snapshot.data!.docs;
                  for (var company in companies) {
                    final email = company.get('email');
                    if (_auth.currentUser!.email == email) {
                      //final no = company.get('id');
                      final name = company.get('title');
                      final status = company.get('reason');

                      final companyWidget = ItemLineOne(
                        //no: no,
                        name: name,
                        status: status,
                      );
                      _allCompanies.add({"name": name});

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

class ItemLineOne extends StatelessWidget {
  TextEditingController customController = TextEditingController();
  var pressedValue = false;
  final _firestore = FirebaseFirestore.instance;
  ItemLineOne(
      {this.no,
      this.name,
      this.phone,
      this.email,
      Key? key,
      status,
      title,
      description,
      price,
      bio,
      img,
      id})
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
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Text(
                '$no \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t \t $name \t',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 6,
        )
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
