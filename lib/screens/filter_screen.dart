import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';
import 'package:jordantimes_final/screens/category_trips_screen.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final _firestore = FirebaseFirestore.instance;
  String dropdownvalue = '1 Passenger';
  int noOfPassengers = 1;
  var period = " ";
  DateTimeRange? myDateRange;
  var items = [
    '1 Passenger',
    '2 Passengers',
    '3 Passengers',
    '4 Passengers',
    '5 Passengers',
    '6 Passengers'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filter Screen'),
        ),
        body: Column(children: [
          
          SizedBox(height: 8.0),
          Center(
            child: Container(
              width: 300.0,
              height: 70.0,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: dropdownvalue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (newValue) {
                      dropdownvalue = newValue.toString();
                      if (dropdownvalue == "1 Passenger") {
                        noOfPassengers = 1;
                      } else if (dropdownvalue == "2 Passenggers") {
                        noOfPassengers = 2;
                      } else if (dropdownvalue == "3 Passengers") {
                        noOfPassengers = 3;
                      } else if (dropdownvalue == "4 Passengers") {
                        noOfPassengers = 4;
                      } else if (dropdownvalue == "5 Passengers") {
                        noOfPassengers = 5;
                      } else if (dropdownvalue == "6 Passengers") {
                        noOfPassengers = 6;
                      }
                    }),
              ),
            ),
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
                period =
                    (myDateRange!.end.day - myDateRange!.start.day).toString();
              }),
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Material(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              elevation: 5.0,
              child: MaterialButton(
                  minWidth: 400.0,
                  height: 42.0,
                  child: Text('Apply Filter'),
                  onPressed: () async {
                    print(noOfPassengers);
                    print(period);

                    Navigator.of(context).pop(MaterialPageRoute(
                        builder: (context) =>
                            CategoryTripsScreen(noOfPassengers, period)));
                  }),
            ),
          ),
        ]));
  }
}
