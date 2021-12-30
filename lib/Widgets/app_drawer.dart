import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:jordantimes_final/screens/Goverment_History.dart';
import 'package:jordantimes_final/screens/Goverment_Notifications_screen.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';
import 'package:jordantimes_final/screens/welcome_screen.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final _auth = FirebaseAuth.instance;

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
              'MOTA',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 20),
          new ListTile(
              leading: const Icon(Icons.home),
              title: Text('Dashboard', style: Theme.of(context).textTheme.headline6),
              onTap: () {
               //Keep At Same Page
              }),
          SizedBox(height: 20),
           new ListTile(
              leading: const Icon(Icons.notifications),
              title: Text('Notifications', style: Theme.of(context).textTheme.headline6),
              onTap: () {
                 
               
              }),
         
          SizedBox(height: 20),
          new ListTile(
             leading: const Icon(Icons.history),
              title: Text('History', style: Theme.of(context).textTheme.headline6),
              onTap: () {
                Navigator.of(context).pushNamed(
                       'Goverment_History');
                 
               
              }),
        
          SizedBox(height: 20),
          new ListTile(
             leading: const Icon(Icons.logout),
              title: Text('Logout', style: Theme.of(context).textTheme.headline6),
              onTap: () {
                _auth.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => WelcomeScreen()));
              }),
        ],
      ),
    );
  }
}
