import 'dart:ffi';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_range_form_field/date_range_form_field.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:jordantimes_final/Widgets/company_drawer.dart';
import 'package:jordantimes_final/api/FirebaseApi.dart';
import 'package:jordantimes_final/api/checkbox_state.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';
import 'package:jordantimes_final/screens/Locations_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:jordantimes_final/screens/Login_screen.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

import 'package:path/path.dart';

class CompanyScreen extends StatefulWidget {
  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

GlobalKey<FormState> myFormKey = new GlobalKey();

class _CompanyScreenState extends State<CompanyScreen> {
  final _firestore = FirebaseFirestore.instance;
  final formKey = new GlobalKey<FormState>();
   final _auth = FirebaseAuth.instance;
  String loggedName = " ";

  DateTimeRange? myDateRange;
  List? _myFromLocations;
  List? _myToLocations;
  String _myFromLocationsResult = " ";
  String _myToLocationsResult = "";

  String id = " ";
  String title = " ";
  String description = " ";
  String arDescription = " ";
  int price = 0;
  int seats = 0;
  bool breakfast = false;
  bool lunch = false;
  bool dinner = false;
  int breakfast_price = 0;
  int lunch_price = 0;
  int dinner_price = 0;
  List<String> meals = [];

  UploadTask? task;
  File? file;
  List<File>? files;

  bool value = false;
  //final meals = [
  //checkBoxState(title: 'Breakfast'),
  //checkBoxState(title: 'Lunch'),
  //checkBoxState(title: 'Dinner'),

  //];
/*List<String> mealsList = [];
  @override
  Widget buildSingleCheckbox(checkBoxState checkbox) => CheckboxListTile(
      activeColor: Colors.red,
      value: checkbox.value,
      title: Text(checkbox.title, style: TextStyle(fontSize: 20)),
      onChanged: (value) =>
          setState(() => {checkbox.value = value!,
          mealsList.add(checkbox.title) }));*/

  @override
  void initState() {
    super.initState();
    _myFromLocations = [];
    _myFromLocationsResult = '';
    
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        _myFromLocationsResult = _myFromLocations.toString();
        _myToLocationsResult = _myToLocations.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final fileName =
        file != null ? basename(file!.path) : 'You can select up to 6 images';
    final _auth = FirebaseAuth.instance;
    var name = " ";

    List<String> _foundUsers = [];

    StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('users').snapshots(),
        builder: (context, snapshot) {
          List<ItemLine> companiesWidgets = [];
          if (!snapshot.hasData) {
            return CircularProgressIndicator(
              backgroundColor: Colors.red,
            );
          }

          final companies = snapshot.data!.docs;
          for (var company in companies) {
            if (company.get('email') == _auth.currentUser!.email) {
              name = company.get('name');

              final companyWidget = ItemLine(
                name: name,
              );
               print(name.toString() + "sasas");

              companiesWidgets.add(companyWidget);
            }
          }

         

          return Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 24),
              children: companiesWidgets,
            ),
          );
        });
    if (_auth.currentUser!.email != null) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(loggedName.toString()),
        ),
        drawer: CompanyDrawer(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
              Card(
                color: Colors.white,
                child: TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    arDescription = value;
                  },
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: 'Enter Campagin Descripton : بالعربي',
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
              DateRangeField(
                  enabled: true,
                  initialValue: DateTimeRange(
                      start: DateTime.now(),
                      end: DateTime.now().add(Duration(days: 5))),
                  decoration: InputDecoration(
                    labelText: 'Duration',
                    prefixIcon: Icon(Icons.date_range),
                    hintText: 'Please select a start and end date',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    myDateRange = value!;
                    print(myDateRange);
                  }),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  price = int.parse(value);
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
              MultiSelectFormField(
                autovalidate: false,
                chipBackGroundColor: Colors.red,
                chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                checkBoxActiveColor: Colors.red,
                checkBoxCheckColor: Colors.white,
                dialogShapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                title: Text(
                  "Location Form :",
                  style: TextStyle(fontSize: 16),
                ),
                dataSource: [
                  {
                    "display": "Amman",
                    "value": "Amman",
                  },
                  {
                    "display": "Aqaba",
                    "value": "Aqaba",
                  },
                  {
                    "display": "Balqa",
                    "value": "Balqa",
                  },
                  {
                    "display": "Jarash",
                    "value": "Jarash",
                  },
                  {
                    "display": "Irbid",
                    "value": "Irbid",
                  },
                  {
                    "display": "Maan",
                    "value": "Maan",
                  },
                  {
                    "display": "Mafraq",
                    "value": "Mafraq",
                  },
                  {
                    "display": "Ajloun",
                    "value": "Ajloun",
                  },
                  {
                    "display": "Madaba",
                    "value": "Madaba",
                  },
                  {
                    "display": "Tafila",
                    "value": "Tafila",
                  },
                  {
                    "display": "Karak",
                    "value": "Karak",
                  },
                ],
                textField: 'display',
                valueField: 'value',
                okButtonLabel: 'OK',
                cancelButtonLabel: 'CANCEL',
                hintWidget: Text('Please choose one or more'),
                initialValue: _myFromLocations,
                onSaved: (value) {
                  if (value == null) return;
                  setState(() {
                    _myFromLocations = value;
                  });
                },
              ),
              SizedBox(
                height: 18.0,
              ),
              MultiSelectFormField(
                autovalidate: false,
                chipBackGroundColor: Colors.red,
                chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                checkBoxActiveColor: Colors.red,
                checkBoxCheckColor: Colors.white,
                dialogShapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                title: Text(
                  "Location To :",
                  style: TextStyle(fontSize: 16),
                ),
                dataSource: [
                  {
                    "display": "Amman",
                    "value": "Amman",
                  },
                  {
                    "display": "Aqaba",
                    "value": "Aqaba",
                  },
                  {
                    "display": "Balqa",
                    "value": "Balqa",
                  },
                  {
                    "display": "Jarash",
                    "value": "Jarash",
                  },
                  {
                    "display": "Irbid",
                    "value": "Irbid",
                  },
                  {
                    "display": "Maan",
                    "value": "Maan",
                  },
                  {
                    "display": "Mafraq",
                    "value": "Mafraq",
                  },
                  {
                    "display": "Ajloun",
                    "value": "Ajloun",
                  },
                  {
                    "display": "Madaba",
                    "value": "Madaba",
                  },
                  {
                    "display": "Tafila",
                    "value": "Tafila",
                  },
                  {
                    "display": "Karak",
                    "value": "Karak",
                  },
                ],
                textField: 'display',
                valueField: 'value',
                okButtonLabel: 'OK',
                cancelButtonLabel: 'CANCEL',
                hintWidget: Text('Please choose one or more'),
                initialValue: _myToLocations,
                onSaved: (value) {
                  if (value == null) return;
                  setState(() {
                    _myToLocations = value;
                  });
                },
              ),
              SizedBox(
                height: 18.0,
              ),
              Text('No of seats'),
              SpinBox(
                min: 1,
                max: 100,
                value: 5,
                onChanged: (value) => seats = value.toInt(),
              ),
              SizedBox(
                height: 18.0,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: breakfast,
                        onChanged: (bool? value) {
                          // This is where we update the state when the checkbox is tapped
                          setState(() {
                            breakfast = value!;
                            breakfast_price = 2;
                            meals.add('breakfast');
                          });
                        },
                      ),
                      Text('Breakfast'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: lunch,
                        onChanged: (bool? value) {
                          // This is where we update the state when the checkbox is tapped
                          setState(() {
                            lunch = value!;
                            lunch_price = 5;
                            meals.add('lunch');
                          });
                        },
                      ),
                      Text('Lunch')
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: dinner,
                        onChanged: (bool? value) {
                          // This is where we update the state when the checkbox is tapped
                          setState(() {
                            dinner = value!;
                            dinner_price = 10;
                            meals.add('dinner');
                          });
                        },
                      ),
                      Text('Dinner')
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton.icon(
                      onPressed: () {
                        selectFile();
                      },
                      icon: Icon(Icons.camera),
                      label: Text('Upload Image')),
                  SizedBox(height: 8.0),
                  Text(
                    fileName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(height: 8.0),

              /*ListView(
          children: [
            //...meals.map(buildSingleCheckbox).toList(),
            
          ],
        ),*/
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      String img = await uploadFile();
                      String img2 = await uploadFile2();
                      String img3 = await uploadFile3();
                      final loggedUser = _auth.currentUser;
                      price =
                          price + breakfast_price + lunch_price + dinner_price;
                      print(_myFromLocations);
                      print(_myToLocations);

                      _firestore.collection('trips').doc(id).set({
                        'userId': loggedUser!.uid,
                        'id': id,
                        'email': _auth.currentUser!.email,
                        'title': title,
                        'description': description,
                        'ar_description': arDescription,
                        'price': price.toString(),
                        'img': img,
                        'img2': img2,
                        'img3': img3,
                        'seats': seats,
                        'date': myDateRange.toString(),
                        'meals': meals,
                        'locations_from': _myFromLocations,
                        'locations_to': _myToLocations,
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => CompanyScreen()));
          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.grey,
        ),
      );

      
    }
    return LoginScreen();
   
  }

   
  Future selectFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      files = result.paths.map((path) => File(path!)).toList();
      print(files);
    }
  }

  Future uploadFile() async {
    final fileName = basename(files![0].toString());
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, files![0]);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final String urlDownload = await snapshot.ref.getDownloadURL();

    return urlDownload;
    print(urlDownload);
  }

  Future uploadFile2() async {
    final fileName = basename(files![1].toString());
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, files![1]);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final String urlDownload = await snapshot.ref.getDownloadURL();

    return urlDownload;
    print(urlDownload);
  }

  Future uploadFile3() async {
    final fileName = basename(files![2].toString());
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, files![2]);
    

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final String urlDownload = await snapshot.ref.getDownloadURL();

    return urlDownload;
    print(urlDownload);
  }


  

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );


      
}
