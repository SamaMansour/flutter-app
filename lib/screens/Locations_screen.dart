// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:jordantimes_final/api/checkbox_state.dart';
import 'package:jordantimes_final/screens/Company_screen.dart';

class LocationsScreen extends StatefulWidget {
  var locations = new List.filled(5, null, growable: false);
  
  @override
  _LocationsScreenState createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  bool value = false;
  final locations = [
    checkBoxState(title: 'Amman'),
    checkBoxState(title: 'Aqaba'),
    checkBoxState(title: 'Balqa'),
    checkBoxState(title: 'Jarash'),
    checkBoxState(title: 'Ajloun'),
    checkBoxState(title: 'Mafraq'),
    checkBoxState(title: 'Azraq'),
    checkBoxState(title: 'Irbid'),
    checkBoxState(title: 'Maan'),
    checkBoxState(title: 'Madaba'),
    checkBoxState(title: 'Tafila'),
    checkBoxState(title: 'Karak'),
  ];
  @override
  Widget buildSingleCheckbox(checkBoxState checkbox) => CheckboxListTile(
      activeColor: Colors.red,
      value: checkbox.value,
      title: Text(checkbox.title, style: TextStyle(fontSize: 20)),
      onChanged: (value) =>
          setState(() => {checkbox.value = value!, }));

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: ListView(
          children: [
            ...locations.map(buildSingleCheckbox).toList(),
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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => CompanyScreen(
                              locations: [],
                            )));
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Add Locations',
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
