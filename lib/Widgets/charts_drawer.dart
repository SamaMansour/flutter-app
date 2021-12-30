import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:jordantimes_final/screens/Goverment_Notifications_screen.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';
import 'package:jordantimes_final/screens/User_chart_screen.dart';
import 'package:jordantimes_final/screens/posts_screen.dart';
import 'package:jordantimes_final/screens/welcome_screen.dart';

class ChartsDrawer extends StatelessWidget {
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
            'Charts',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 20),
          new ListTile(
             
              title: Text('Column Charts', style: Theme.of(context).textTheme.headline6),
              onTap: () {
                  Navigator.of(context).pushNamed(
                       'Column_User_Chart');
                
              }),
          SizedBox(height: 20),
      
        ],
      ),
    );
  }
}
