import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:jordantimes_final/screens/Goverment_Notifications_screen.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';
import 'package:jordantimes_final/screens/User_chart_screen.dart';
import 'package:jordantimes_final/screens/posts_screen.dart';
import 'package:jordantimes_final/screens/welcome_screen.dart';
import 'package:translator/translator.dart';

class AdminDrawer extends StatefulWidget {
  
  @override
  State<AdminDrawer> createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
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
            'Admin',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 20),
          new ListTile(
               leading: const Icon(Icons.home),
              title: Text('Dashboard', style: Theme.of(context).textTheme.headline6),
              onTap: () {
                  Navigator.of(context).pushNamed(
                       'Admin_screen');
                
              }),
         
           
         
          SizedBox(height: 20),
          new ListTile(
             leading: const Icon(Icons.pie_chart),
              title: Text('Charts', style: Theme.of(context).textTheme.headline6),
              onTap: () {
                  Navigator.of(context).pushNamed(
                       'User_chart_screen');
               
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
