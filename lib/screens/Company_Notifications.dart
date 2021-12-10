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


  @override
  Widget build(BuildContext context) {
   
   
    return Scaffold(
        appBar: AppBar(title: Text('Notifications')),
        body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<QuerySnapshot>(
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
                   
                   
                      final title = company.get('title');
                      final reason = company.get('reason');
                      

                      final companyWidget = Card(
                         shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            ListTile(
                             
                              title:
                                  Text(title, style: TextStyle(fontSize: 20)),
                              subtitle: Text(
                               'Your post with'+ 
                               'have been reported'+ reason,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.9)),
                              ),
                             
                            ),
                          ],
                        ),
                      
                      );

                      companiesWidgets.add(companyWidget);
                    
                  }
                  return Expanded(
                    child: ListView(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 24),
                      children: companiesWidgets,
                    ),
                  );
                }),


                 StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('members').snapshots(),
                builder: (context, snapshot) {
                  List<Card> companiesWidgets = [];
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    );
                  }

                  final companies = snapshot.data!.docs;
                  for (var company in companies) {
                   
                   
                    final id = company.get('id');
                    final name = company.get('name');
                    final age =company.get('age');
                    final nationalId = company.get('nationalId');
                    final name1 = company.get('name 1');
                    final age1 = company.get('age 1');
                    final nationalId1 = company.get('nationalId 1');
                    final name2 =  company.get('name 2');
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

                      

                      final companyWidget = Card(
                         shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            ListTile(
                             
                              title:
                                  Text(name, style: TextStyle(fontSize: 20)),
                              subtitle: Text(
                               'has booked with'+ name1 + 'and'+'\n'+ name2 + 'and'+ name3 + 'and'+name4 + 'and'+ name5 + 'and'+ name6,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.9)),
                              ),
                             
                            ),
                          ],
                        ),
                      
                      );

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
