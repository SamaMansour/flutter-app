import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/screens/category_trips_screen.dart';
import 'package:jordantimes_final/screens/other_members.dart';

class ReservationDetails extends StatefulWidget {
  const ReservationDetails({Key? key}) : super(key: key);

  @override
  _ReservationDetailsState createState() => _ReservationDetailsState();
}

class _ReservationDetailsState extends State<ReservationDetails> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  
  final _auth = FirebaseAuth.instance;
  String age = " ";
  String nationalId = " ";

  @override
  void initState() {
    super.initState();
    getName();
    getPhone();
  }

  @override
  Widget build(BuildContext context) {
    final args =ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(title: Text('Add Members')),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // First Component Shown
                TextFormField(
                  textAlign: TextAlign.center,
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Name ',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  ),
                ),

                SizedBox(height: 8.0),

                TextFormField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    age = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'Age ',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  ),
                ),

                SizedBox(height: 8.0),

                TextFormField(
                  textAlign: TextAlign.center,
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: 'Phone',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  ),
                ),

                SizedBox(height: 8.0),

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

                SizedBox(height: 32.0),

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
                        FirebaseFirestore.instance
                            .collection('members')
                            .doc(_auth.currentUser!.email)
                            .set({
                              'id': args.id,
                          'email': _auth.currentUser!.email,
                          'name': _nameController.text,
                          'phone':_phoneController.text,
                          'age': age,
                          'nationalId': nationalId,
                        });
                       Navigator.of(context).pushNamed(
                       'payment_screen');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => OtherMembers()));
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.grey,
      ),
    );
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
