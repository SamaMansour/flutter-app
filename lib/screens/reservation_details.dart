import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/screens/Admin_screen.dart';
import 'package:jordantimes_final/screens/Company_screen.dart';
import 'package:jordantimes_final/screens/ForgotPassword_screen.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';
import 'package:jordantimes_final/screens/SendOtp_screen.dart';
import 'package:jordantimes_final/screens/User_screen.dart';
import 'package:jordantimes_final/screens/category_trips_screen.dart';
import 'package:jordantimes_final/screens/other_members.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class ReservationDetails extends StatefulWidget {
  @override
  _ReservationDetailsState createState() => _ReservationDetailsState();
}

class _ReservationDetailsState extends State<ReservationDetails> {
  final _auth = FirebaseAuth.instance;
  String age = " ";
  String nationalId = " ";

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getName();
    getPhone();
  }

  //Age Validation
  bool isValidAge(value) {
    return value >= 18;
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Name ',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  ),
                ),
                sizedBox(),
                TextFormField(
                  textAlign: TextAlign.center,
                  validator: (v) {
                    if (isValidAge(v)) {
                      age = v!;
                      return null;
                    } else
                      return 'Please enter a valid age';
                  },
                  decoration: InputDecoration(
                    hintText: 'age>18',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  ),
                ),
                sizedBox(),
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: 'Phone',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  ),
                ),
                sizedBox(),
                TextFormField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    nationalId = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'National ID ',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  ),
                ),
                sizedBox(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      minWidth: 400.0,
                      height: 42.0,
                      child: Text('Book Now '),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            FirebaseFirestore.instance
                                .collection('members')
                                .doc(_auth.currentUser!.email)
                                .set({
                              'id': args.id,
                              'email': _auth.currentUser!.email,
                              'name': _nameController.text,
                              'phone': _phoneController.text,
                              'age': age,
                              'nationalId': nationalId,
                              'name 1': "null",
                              'age 1 ': "null",
                              'nationalId 1': "null",
                              'name 2': " null",
                              'age 2 ': "null",
                              'nationalId 2': "null",
                              'name  3': "null",
                              'age 3 ': "null",
                              'nationalId 3 ': "null",
                              'name 4': "null",
                              'age 4 ': "null",
                              'nationalId 4': "null",
                              'name 5': "null",
                              'age 5 ': "null",
                              'nationalId 5': "null",
                              'name 6': "null",
                              'age 6 ': "null",
                              'nationalId 6': "null"
                            });
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => OtherMembers()));
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                    ),


                    
                  ),
                ),
                
              ],
            ),
            
          ),


          
        ),
      ),
    ));
  }

  Future<void> getName() async {
    await for (var snapshot
        in FirebaseFirestore.instance.collection('users').snapshots()) {
      for (var savedUser in snapshot.docs) {
        if (savedUser.get('email') as String ==
            _auth.currentUser!.email as String) {
          _nameController.text = savedUser.get('name') as String;
          print(_nameController.text);
          setState(() => _nameController.text = _nameController.text);
        }
      }
    }
  }

  Future<void> getPhone() async {
    await for (var snapshot
        in FirebaseFirestore.instance.collection('users').snapshots()) {
      for (var savedUser in snapshot.docs) {
        if (savedUser.get('email') as String ==
            _auth.currentUser!.email as String) {
          _phoneController.text = savedUser.get('phone') as String;
          print(_phoneController.text);
          setState(() => _phoneController.text = _phoneController.text);
        }
      }
    }
  }
}

class sizedBox extends StatelessWidget {
  const sizedBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.0,
    );
  }
}
