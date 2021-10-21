import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/Widgets/company_drawer.dart';
import 'package:jordantimes_final/api/FirebaseApi.dart';
import 'package:jordantimes_final/screens/Locations_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';

class CompanyScreen extends StatefulWidget {
  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  final _firestore = FirebaseFirestore.instance;
  String id = " ";
  String title = " ";
  String description = " ";
  String price = "";
  var locations = [];
  @override
  Widget build(BuildContext context) {
    UploadTask? task;
    File? file;
    final fileName = file != null ? basename(file.path) : 'No file is selected';

    Future selectFile() async {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(allowMultiple: true);
      if (result == null) return;
      final path = result.files.single.path!;
      setState(() => file = File(path));
    }

    Future uploadFile() async {
      if (file == null) return;
      final fileName = basename(file!.path);
      final destination = 'files/$fileName';

      FirebaseApi.uploadFile(destination, file!);
    }

    final _auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text(_auth.currentUser!.email as String),
      ),
      drawer: CompanyDrawer(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                id = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter Campagin ID ',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                title = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter Campagin Title ',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Card(
              color: Colors.white,
              child: TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  description = value;
                },
                maxLines: 8,
                decoration: InputDecoration(
                  hintText: 'Enter Campagin Descripton',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                price =value ;
              },
              decoration: InputDecoration(
                hintText: 'Enter price',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(children: [
              TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => LocationsScreen()));
                  },
                  icon: Icon(Icons.map),
                  label: Text('location')),
              TextButton.icon(
                  onPressed: () {
                    selectFile();
                  },
                  icon: Icon(Icons.camera),
                  label: Text('Upload Image')),
              Text(fileName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
            ]),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async {
                    final loggedUser = _auth.currentUser;
                    _firestore.collection('trips').add({
                      'id': loggedUser!.uid,
                      'title':title,
                      'description':description,
                      'price':price,
                    });
                    uploadFile();
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Add Campagin',
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
