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
        children: [],
      ),
    );
  }
}
