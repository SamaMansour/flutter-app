import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:jordantimes_final/screens/Goverment_History.dart';
import 'package:jordantimes_final/screens/Goverment_Notifications_screen.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';
import 'package:jordantimes_final/screens/Rejected_companies.dart';
import 'package:jordantimes_final/screens/welcome_screen.dart';

class HistoryDrawer extends StatelessWidget {
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
              'History',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 20),
          new ListTile(
             
              title: Text('Accepted', style: Theme.of(context).textTheme.headline6),
              onTap: () {
                 Navigator.of(context).pushNamed(
                       'Goverment_History');
                 
              }),
          SizedBox(height: 20),
           new ListTile(
              title: Text('Rejected', style: Theme.of(context).textTheme.headline6),
              onTap: () {
                Navigator.of(context).pushNamed(
                       'Rejected_companies');
                
              }),
         
         
        ],
      ),
    );
  }
}
