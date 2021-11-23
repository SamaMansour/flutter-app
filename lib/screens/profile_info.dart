import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/Widgets/profile_widget.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String? nameEdit;
  String? emailEdit;
  String? phoneEdit;
  String? bioEdit;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          elevation: 0.0,
          backgroundColor: Colors.red,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection('profiles').snapshots(),
            builder: (context, snapshot) {
              List<ListView> companiesWidgets = [];
              if (!snapshot.hasData) {
                return CircularProgressIndicator(
                  backgroundColor: Colors.red,
                );
              }

              final companies = snapshot.data!.docs;
              for (var company in companies) {
                
              
                  final email = company.get('email');
                  final name = company.get('name');
                  final phone = company.get('phone');
                  final img = company.get('img');
                  final bio = company.get('bio');

                  final companyWidget = ListView(
                    children: <Widget>[
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.red, Colors.red],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: [0.5, 0.9],
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.white70,
                                  minRadius: 60.0,
                                  child: CircleAvatar(
                                    radius: 50.0,
                                    backgroundImage: NetworkImage(
                                        'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(),
                      Container(
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                'Email',
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                               email,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Divider(),
                            ListTile(
                              title: Text(
                                'Phone',
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                               phone,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Divider(),
                            ListTile(
                              title: Text(
                                'Bio',
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                               bio,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );

                  companiesWidgets.add(companyWidget);
                
              }
              return Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 24),
                  children: companiesWidgets,
                ),
              );
            }));
  }
}
