import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';

class CompanyNotifications extends StatefulWidget {
  @override
  _CompanyNotificationsState createState() => _CompanyNotificationsState();
}

class _CompanyNotificationsState extends State<CompanyNotifications> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  var setten = false;
  var status = 'Congrates !! Now you can enjoy JordanTimes';
  var reason = ' ';
  var id = '  ';

  @override
  Widget build(BuildContext context) {
   
   
    return Scaffold(
        appBar: AppBar(title: Text('Notifications')),
        body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('reported').snapshots(),
        builder: (context, snapshot) {
          List<Card> companiesWidgets = [];
          if (!snapshot.hasData) {
            return CircularProgressIndicator(
              backgroundColor: Colors.red,
            );
          }

          final companies = snapshot.data!.docs;
          for (var company in companies) {
          
              id = company.get('id');
              //reason = company.get('reason');

              final companyWidget = Card(
                  child: Text('Your post with' +
                      id.toString() +
                      'has been reported for' 
                      ));

              companiesWidgets.add(companyWidget);
            
          }

          return Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 24),
              children: companiesWidgets,
            ),
          );
        }),

        
        );
  }
}
