// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:jordantimes_final/api/checkbox_state.dart';
import 'package:jordantimes_final/screens/Company_screen.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class LocationsScreen extends StatefulWidget {
  @override
  _LocationsScreenState createState() => _LocationsScreenState();
}

class _LocationsScreenState extends State<LocationsScreen> {
  List? _myFromLocations;
  late String _myFromLocationsResult;
  List? _myToLocations;
  late String _myToLocationsResult;
  bool breakfast = false;
  bool lunch = false;
  bool dinner = false;
  int breakfast_price = 0;
  int lunch_price = 0;
  int dinner_price = 0;
  int calc_price = 0;

  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myFromLocations = [];
    _myFromLocationsResult = '';
    _myToLocations = [];
    _myToLocationsResult = '';
  }

  _saveForm() {
    var form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      setState(() {
        _myFromLocationsResult = _myFromLocations!.join(',');
        _myToLocationsResult = _myToLocations!.join(',');
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Column(
        children: [
          MultiSelectFormField(
          
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
          Column(children: [
            Row(
              children: [
                Checkbox(
                  value: breakfast,
                  onChanged: (bool? value) {
                    // This is where we update the state when the checkbox is tapped
                    setState(() {
                      breakfast = value!;
                      breakfast_price = 2;
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
                    });
                  },
                ),
                Text('Dinner')
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () async {
                    calc_price = breakfast_price + lunch_price + dinner_price; 
                    print(_myFromLocations);
                    print(_myToLocations);
                    print(_myFromLocationsResult);
                    print(_myToLocationsResult);
                    Navigator.of(context).pop(MaterialPageRoute(
                        builder: (context) =>
                            CompanyScreen()));
                  },
                  minWidth: 400.0,
                  height: 42.0,
                  child: Text(
                    'Add Details',
                  ),
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
