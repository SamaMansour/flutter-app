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
    TextEditingController _nameController =
        TextEditingController(text: nameEdit);
    TextEditingController _emailController =
        TextEditingController(text: emailEdit);
    TextEditingController _phoneController =
        TextEditingController(text: phoneEdit);
    TextEditingController _bioController = TextEditingController(text: bioEdit);
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          elevation: 0.0,
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('profiles').snapshots(),
                builder: (context, snapshot) {
                  List<ItemLine> companiesWidgets = [];
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    );
                  }

                  final profiles = snapshot.data!.docs;
                  for (var profile in profiles) {
                    if (profile.get('email') == _auth.currentUser!.email) {
                      final name = profile.get('name');
                      final phone = profile.get('phone');
                      final email = profile.get('email');
                      final bio = profile.get('bio');
                      final img = profile.get('img');

                      final companyWidget = Column(
                        children: [
                          ProfileWidget(
                            onClicked: () async {},
                            imagePath: img,
                            isEdit: true,
                          ),
                          const SizedBox(height: 24),
                          TextField(
                            controller: _nameController,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: 'Enter Company Name ',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          TextField(
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: 'Enter Company Email ',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          TextField(
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: 'Enter Company Phone ',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          TextField(
                            maxLines: 5,
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: 'Enter Company Bio ',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0)),
                              ),
                            ),
                          ),
                        ],
                      );

                      //companiesWidgets.add(companyWidget);
                    }
                  }
                  return Expanded(
                    child: ListView(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 24),
                      children: companiesWidgets,
                    ),
                  );
                }),
          ],
        ));
  }
}
