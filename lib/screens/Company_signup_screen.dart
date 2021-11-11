import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/screens/SendOtp_screen.dart';

class CompanySignupScreen extends StatefulWidget {
  @override
  _CompanySignupScreenState createState() => _CompanySignupScreenState();
}

class _CompanySignupScreenState extends State<CompanySignupScreen> {
  String email = " ";
  String name = " ";
  String number = " ";
  String phone = " ";
  String password = " ";
  String confirmPassword = " ";
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  bool val = false;
  //Email Validation
  bool isValidEmail(value) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(value);
  }
  //Name Validation

  bool isValidName(value) {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(value);
  }

  //Password Validation

  bool isValidPassword(value) {
    final passwordRegExp = new RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(value);
  }

  //Check Nullity

  bool isNotNull(value) {
    return value != null;
  }

  //Phone Validation

  bool isValidPhone(value) {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{9}$");
    return phoneRegExp.hasMatch(value);
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
              _numberTextField(),
              _sizedBox(),
              _nameTextField(),
              _sizedBox2(),
              _emailTFTextField(),
              _sizedBox3(),
              _phoneTextField(),
              _sizedBox4(),
              _passwordTextField(),
              _sizedBox5(),
              _confirmPasswordTextField(),
              _sizedBox6(),
              _submitButton(),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _numberTextField() {
    return TextFormField(
      textAlign: TextAlign.center,
      validator: (v) {
        var document = FirebaseFirestore.instance.collection('users').doc(v);

        document.get().then(
            (docData) => {if (docData.exists) val = true else val = false});

        if (val == true)
          return 'This number already exists';
        else {
          number = v!;
          return null;
          
          
        }
      },
      decoration: InputDecoration(
        hintText: 'Enter Company Number',
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

  Widget _sizedBox() {
    return sizedBox();
  }

  Widget _nameTextField() {
    return TextFormField(
      textAlign: TextAlign.center,
      validator: (v) {
        if (isNotNull(v)) {
          name = v!;
          return null;
        } else {
          return 'Please enter a valid name';
        }
      },
      decoration: InputDecoration(
        hintText: 'Enter Company Name ',
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

  Widget _phoneTextField() {
    return TextFormField(
      textAlign: TextAlign.center,
      validator: (v) {
        if (isValidPhone(v)) {
          phone = v!;
          return null;
        } else {
          return 'Phone Number must be up to 9 digits starting with 962';
        }
      },
      decoration: InputDecoration(
        hintText: ' +962 Enter Company Phone',
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

  Widget _sizedBox4() {
    return sizedBox();
  }

  Widget _passwordTextField() {
    return TextFormField(
      textAlign: TextAlign.center,
      obscureText: true,
      validator: (v) {
        if (isValidPassword(v)) {
          password = v!;
          return null;
        } else {
          return 'Password must contain an uppercase, lowercase, numeric digit and special character';
        }
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

  Widget _sizedBox5() {
    return sizedBox();
  }

  Widget _confirmPasswordTextField() {
    return TextFormField(
      textAlign: TextAlign.center,
      obscureText: true,
      validator: (v) {
        if (v != password) {
          return 'Your Password must match';
        }
        confirmPassword = v!;
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Repeat password',
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

  Widget _sizedBox6() {
    return sizedBox();
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
          child: Text('Signup'),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              try {
                final newUser = await _auth.createUserWithEmailAndPassword(
                    email: email, password: password);
              } catch (e) {
                print(e);
              }
              // Insert Users into Firestore
              final loggedUser = _auth.currentUser;

              _firestore.collection('users').doc(number).set({
                'id': number,
                'email': email,
                'number': number,
                'name': name,
                'phone': phone,
                'role': "company",
                'verfied': "pending",
              });

              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SendOtp(email)));
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
