import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CompanyNotifications extends StatefulWidget {
  @override
  _CompanyNotificationsState createState() => _CompanyNotificationsState();
}

class _CompanyNotificationsState extends State<CompanyNotifications> {
  final _auth = FirebaseAuth.instance;
  var setten = false;
  var status = 'You are still in pendding status';
  var reason = ' ';

  @override
  Widget build(BuildContext context) {
    //Notifications in case of got declined
    var declinedDocument = FirebaseFirestore.instance
        .collection('declined')
        .doc(_auth.currentUser!.email);
    print(_auth.currentUser!.uid);
    declinedDocument.get().then((docData) => {
          if (docData.exists)
            {
              status = 'You have got declined by goverment',
            
            }
        });

    var acceptedDocument = FirebaseFirestore.instance
        .collection('Accepted')
        .doc(_auth.currentUser!.email);
    print(_auth.currentUser!.uid);
    acceptedDocument.get().then((docData) => {
          if (docData.exists) {status = 'You have got accepted  by goverment'}
        });
    return Scaffold(
        appBar: AppBar(title: Text('Notifications')),
        body: Card(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Material(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 20),
                    child: Text(
                      status,
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
