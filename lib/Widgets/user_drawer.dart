import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/screens/Goverment_Notifications_screen.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';
import 'package:jordantimes_final/screens/User_chart_screen.dart';
import 'package:jordantimes_final/screens/posts_screen.dart';
import 'package:jordantimes_final/screens/welcome_screen.dart';

class UserDrawer extends StatefulWidget {
  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  void initState() {
    getName();
  }

  final _auth = FirebaseAuth.instance;

  final _firestore = FirebaseFirestore.instance;
  var loggedName = " ";
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
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.red,
            child: Text(
              loggedName,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 20),
          new ListTile(
              leading: const Icon(Icons.home),
              title: Text('Dashboard',
                  style: Theme.of(context).textTheme.headline6),
              onTap: () {}),
          SizedBox(height: 20),
          new ListTile(
              leading: const Icon(Icons.notifications),
              title: Text('Notifications',
                  style: Theme.of(context).textTheme.headline6),
              onTap: () {}),
          SizedBox(height: 20),
          new ListTile(
              leading: const Icon(Icons.person),
              title: Text('Edit Profile',
                  style: Theme.of(context).textTheme.headline6),
              onTap: () {
                Navigator.of(context).pushNamed('edit_profile_user');
              }),
          SizedBox(height: 20),
          new ListTile(
              leading: const Icon(Icons.favorite),
              title: Text('Favorites',
                  style: Theme.of(context).textTheme.headline6),
              onTap: () {
                Navigator.of(context).pushNamed('favorite_screen');
              }),
          SizedBox(height: 20),
          new ListTile(
              leading: const Icon(Icons.logout),
              title:
                  Text('Logout', style: Theme.of(context).textTheme.headline6),
              onTap: () {
                _auth.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => WelcomeScreen()));
              }),
        ],
      ),
    );
  }

  Future<void> getName() async {
    await for (var snapshot in _firestore.collection('users').snapshots()) {
      for (var savedUser in snapshot.docs) {
        if (savedUser.get('email') as String ==
            _auth.currentUser!.email as String) {
          loggedName = savedUser.get('name') as String;
          print(loggedName);
          setState(() => loggedName = loggedName);
        }
      }
    }
  }
}
