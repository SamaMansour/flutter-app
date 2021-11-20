import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/Widgets/user_drawer.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({ Key? key }) : super(key: key);
  

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text('profile')),
      drawer:UserDrawer(),
      
    );
  }
}