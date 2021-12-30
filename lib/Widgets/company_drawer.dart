import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:jordantimes_final/screens/CompanyHistory.dart';

import 'package:jordantimes_final/screens/Company_screen.dart';
import 'package:jordantimes_final/screens/Goverment_Notifications_screen.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';
import 'package:jordantimes_final/screens/edit_profile.dart';
import 'package:jordantimes_final/screens/welcome_screen.dart';

class CompanyDrawer extends StatefulWidget {
  @override
  _CompanyDrawerState createState() => _CompanyDrawerState();
}

class _CompanyDrawerState extends State<CompanyDrawer> {
  @override
  void initState() {
    getName();

    super.initState();
  }

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String loggedName = "";

  var status = 'Accepted';
  bool setValue = false;

  @override
  Widget buildListTile(String title, IconData icon, Function onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.red,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: onTapLink(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final email = _auth.currentUser!.email;
    var name = " ";

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.only(top: 40),
              alignment: Alignment.center,
              color: Colors.red,
              child: Column(
                children: [
                  Text(
                    loggedName,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 5),
                  Text(status),
                ],
              ),
            ),
            SizedBox(height: 20),
            new ListTile(
                leading: const Icon(Icons.home),
                title: Text('Dashboard',
                    style: Theme.of(context).textTheme.headline6),
                onTap: () {
                  //Keep At The Same Page
                }),
          
            SizedBox(height: 20),
            new ListTile(
                leading: const Icon(Icons.history),
                title: Text('History',
                    style: Theme.of(context).textTheme.headline6),
                onTap: () {
                  Navigator.of(context).pushNamed('CompanyHistory');
                }),
            SizedBox(height: 20),
            new ListTile(
                leading: const Icon(Icons.person),
                title: Text('EditProfile',
                    style: Theme.of(context).textTheme.headline6),
                onTap: () {
                  Navigator.of(context).pushNamed('edit_profile');
                }),
            SizedBox(height: 20),
            new ListTile(
                leading: const Icon(Icons.logout),
                title: Text('Logout',
                    style: Theme.of(context).textTheme.headline6),
                onTap: () {
                  _auth.signOut();
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
                }),
          ],
        ),
      ),
    );
  }

  Future<void> getName() async {
    await for (var snapshot in _firestore.collection('users').snapshots()) {
      for (var savedUser in snapshot.docs) {
        if (savedUser.get('email') as String == _auth.currentUser!.email as String) {
          loggedName = savedUser.get('name') as String;
          print(loggedName);
           setState(() => loggedName = loggedName);


         
        }
      }
    }
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
