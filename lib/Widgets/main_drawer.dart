import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/screens/welcome_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({ Key? key }) : super(key: key);

  @override
 
   
  Widget buildListTile(String title, IconData icon, Function onTapLink) {
     final _auth = FirebaseAuth.instance;
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
            'Home',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 20),
          new ListTile(
               leading: const Icon(Icons.phone),
              title: Text('Contactus', style: Theme.of(context).textTheme.headline6),
              onTap: () {
                  Navigator.of(context).pushNamed(
                       'contactus');
                
              }),
         
           
         
          SizedBox(height: 20),
          new ListTile(
             leading: const Icon(Icons.money),
              title: Text('Currency Converter', style: Theme.of(context).textTheme.headline6),
              onTap: () {
                   Navigator.of(context).pushNamed(
                       'currency_converter');
                
              }),

               
        
          SizedBox(height: 20),
          new ListTile(
            leading: const Icon(Icons.translate),
              title: Text('Change Language ', style: Theme.of(context).textTheme.headline6),
              onTap: () {
              
              }),
        ],
      ),
    );
  }
  }
