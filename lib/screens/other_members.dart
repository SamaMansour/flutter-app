import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtherMembers extends StatefulWidget {
  const OtherMembers({Key? key}) : super(key: key);

  @override
  _OtherMembersState createState() => _OtherMembersState();
}

class _OtherMembersState extends State<OtherMembers> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String name = " ";
  String age = " ";
  String nationalId = " ";
  static int count = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
//Second Component Shown

                TextFormField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    name = value;
                  },
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
                        count++;
                        FirebaseFirestore.instance
                            .collection('members')
                            .doc(_auth.currentUser!.email)
                            .update({
                          'name ${count}': name,
                          'age ${count}': age,
                          'nationalId ${count}': nationalId,
                        });
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
}
