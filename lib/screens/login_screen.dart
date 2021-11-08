import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jordantimes_final/screens/Admin_screen.dart';
import 'package:jordantimes_final/screens/Company_screen.dart';
import 'package:jordantimes_final/screens/ForgotPassword_screen.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';

class LoginScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  String email = ' ';
  String password = ' ';
  List<String> locations = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200.0,
              child: Image.asset('assets/amman.png'),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your email',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your password.',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ForgotPassword()));
                },
                child: Text('Forgot Password?')),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async {
                    final user = _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    final result = _auth.currentUser;

                    //Navigate Goverment To Their Page
                    if (_auth.currentUser!.email == "gov@gmail.com") {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => GovermentScreen()));
                    }
                  
                    //Navigate Admin To Their Page
                    else if (_auth.currentUser!.email == "admin@gmail.com") {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => AdminScreen()));
                    } /*else if (_auth.currentUser!.email ==
                        "sma302000@gmail.com") {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => CompanyScreen( locations: [],)));
                    }*/

                    else {
                      await for (var snapshot
                      in _firestore.collection('users').snapshots()) {
                        for (var savedUser in snapshot.docs) {
                          
                          if (savedUser.get('role') as String == "company") {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CompanyScreen(locations: [],)));
                          }
                        }
                      }
                    }
                  

                    /*await for (var snapshot
                        in _firestore.collection('users').snapshots()) {
                      for (var savedUser in snapshot.docs) {
                        if (savedUser.get('id') as String ==
                            _auth.currentUser!.uid) {
                          if (savedUser.get('role') as String == "user") {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => CompanyScreen()));
                          }
                        }
                      }
                    }*/
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
