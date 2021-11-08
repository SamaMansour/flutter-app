import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/screens/CompanyHistory.dart';
import 'package:jordantimes_final/screens/Company_Notifications.dart';
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
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  var status = 'Pendding';
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
    var document = FirebaseFirestore.instance
        .collection('accepted')
        .doc(_auth.currentUser!.email);
    print(_auth.currentUser!.uid);
    document.get().then((docData) => {
          if (docData.exists)
            {status = 'Accepted'}
          else
            {status = 'Not Accepted'}
        });
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
                    _auth.currentUser!.email as String,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 5),
                  Text(status),
                ],
              ),
            ),
            SizedBox(height: 20),
            new ListTile(
                title: Text('Dashboard',
                    style: Theme.of(context).textTheme.headline6),
                onTap: () {
                 
                }),
            SizedBox(height: 20),
            new ListTile(
                title: Text('Notifications',
                    style: Theme.of(context).textTheme.headline6),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => CompanyNotifications()));
                }),
            SizedBox(height: 20),
            new ListTile(
                title: Text('History',
                    style: Theme.of(context).textTheme.headline6),
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => CompanyHistory()));
                }),
            SizedBox(height: 20),
            new ListTile(
                title: Text('EditProfile',
                    style: Theme.of(context).textTheme.headline6),
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => editProfile()));
                }),
            SizedBox(height: 20),
            new ListTile(
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
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
