import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';

class favoriteScreen extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Favorite List'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('favorites').snapshots(),
                builder: (context, snapshot) {
                  List<ItemLine> companiesWidgets = [];
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    );
                  }

                  final companies = snapshot.data!.docs;

                  for (var company in companies) {
                    final email = company.get('email');
                    if (email == _auth.currentUser!.email) {
                      final id = company.get('id');
                      final title = company.get('title');
                      final description = company.get('description');

                      final companyWidget = ItemLine(
                        id: id,
                        title: title,
                        description: description,
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

class ItemLineView extends StatelessWidget {
  TextEditingController customController = TextEditingController();
  var pressedValue = false;
  final _firestore = FirebaseFirestore.instance;
  ItemLineView(
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
      ]),
    );
  }
}
