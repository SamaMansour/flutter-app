import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/screens/Admin_screen.dart';
import 'package:jordantimes_final/screens/Company_screen.dart';
import 'package:jordantimes_final/screens/ForgotPassword_screen.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';
import 'package:jordantimes_final/screens/SendOtp_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = " ";
  

  String password = " ";

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  bool val = false;
  late String  _myFromLocationsResult = " ";
  late String  _myToLocationsResult =" ";

  late List<String> _myFromLocations =[];
  late List<String> _myToLocations =[];

  

  

  
  //Email Validation
  bool isValidEmail(value) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(value);
  }

  //Password Validation

  bool isValidPassword(value) {
    final passwordRegExp = new RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(value);
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _imageContainer(),
              _sizedBox1(),
              _sizedBox4(),
              _emailTFTextField(),
              _sizedBox2(),
              _passwordTextField(),
              _sizedBox3(),
              _forgotPassword(),
              _submitButton(),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _imageContainer() {
    return Container(
      height: 200.0,
      child: Image.asset('assets/amman.png'),
    );
  }

  Widget _sizedBox1() {
    return sizedBox();
  }

  Widget _sizedBox4() {
    return sizedBox();
  }

  Widget _emailTFTextField() {
    return TextFormField(
      textAlign: TextAlign.center,
      validator: (v) {
        if (isValidEmail(v)) {
          email = v!;
          return null;
        } else {
          return 'Please enter a valid email';
        }
      },
      decoration: InputDecoration(
        hintText: 'Enter Company Email',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
    );
  }

  Widget _sizedBox2() {
    return sizedBox();
  }

  Widget _passwordTextField() {
    return TextFormField(
      textAlign: TextAlign.center,
      obscureText: true,
      validator: (v) {
       
          password = v!;
         
      },
      decoration: InputDecoration(
        hintText: 'Enter Password',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
    );
  }

  Widget _sizedBox3() {
    return sizedBox();
  }

  Widget _forgotPassword() {
    return TextButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => ForgotPassword()));
        },
        child: Text('Forgot Password?'));
  }

  Widget _submitButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 400.0,
          height: 42.0,
          child: Text('Login'),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
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
                    } 
                    else {
                      //Navigate Company To Their Page 
                      await for (var snapshot
                      in _firestore.collection('users').snapshots()) {
                        for (var savedUser in snapshot.docs) {
                          
                          if (savedUser.get('role') as String == "company") {
                            int calc_price =0;
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CompanyScreen()));
                          }
                        }
                      }
                    }

                    //Navigate Users To their Page
                  

                    /*await for (var snapshot
                        in _firestore.collection('users').snapshots()) {
                      for (var savedUser in snapshot.docs) {
                       
                          if (savedUser.get('role') as String == "user") {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => UserScreen()));
                          }
                        
                      }
                    }*/
                  
            }
          },
        ),
      ),
    );
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
