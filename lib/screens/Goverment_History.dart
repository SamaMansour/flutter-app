import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/Widgets/history_drawer.dart';

import 'package:jordantimes_final/screens/Goverment_screen.dart';

class GovermentHistory extends StatefulWidget {
  const GovermentHistory({Key? key}) : super(key: key);

  @override
  _GovermentHistoryState createState() => _GovermentHistoryState();
}

class _GovermentHistoryState extends State<GovermentHistory> {
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
                stream: _firestore.collection('accepted').snapshots(),
                builder: (context, snapshot) {
                  List<ItemLine> companiesWidgets = [];
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    );
                  }
                  //Stream Companies from Database

                  final companies = snapshot.data!.docs;
                  for (var company in companies) {
                    final no = company.get('number');
                    final name = company.get('name');
                    final status = company.get('verfied');

                    final companyWidget = ItemLine(
                      no: no,
                      name: name,
                      status: status,
                    );
                    _allCompanies.add({"no": no, "name": name});

                    companiesWidgets.add(companyWidget);
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
