import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/models/userModel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class UserChart extends StatefulWidget {
  @override
  _UserChartState createState() => _UserChartState();
}

class _UserChartState extends State<UserChart> {
  int noOfUsersNov = 0;
  int noOfUsersDec = 0;
  int noOfUsersJan = 0;
  int noOfUsersFeb = 0;
  int noOfUsersMar = 0;
  int noOfUsersApr = 0;
  int noOfUsersMay = 0;
  int noOfUsersJun = 0;
  int noOfUsersJul = 0;
  int noOfUsersAug = 0;
  int noOfUsersSep = 0;
  int noOfUsersOct = 0;

  DateTime date = DateTime.now();

  @override
  void initState() {
    getNoOfUsersNovember();
    getNoOfUsersDecember();
    getNoOfUsersJanuary();
    getNoOfUsersFebruary();
    getNoOfUsersMarch();
    getNoOfUsersApril();
    getNoOfUsersMay();
    getNoOfUsersJune();
    getNoOfUsersJuly();
    getNoOfUsersAugest();
    getNoOfUsersSeptemper();
    getNoOfUsersOctober();
    int noOfUsersDec = 0;
    int noOfUsersNov = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    // Initialize category axis
                    primaryXAxis: CategoryAxis(),
                    series: <LineSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
              // Bind data source
              dataSource: <SalesData>[
                SalesData('Nov', noOfUsersNov),
                SalesData('Dec', noOfUsersDec),
                SalesData('Jan', noOfUsersJan),
                SalesData('Feb', noOfUsersFeb),
                SalesData('Mar', noOfUsersMar),
                SalesData('Apr', noOfUsersApr),
                SalesData('May', noOfUsersMay),
                SalesData('June', noOfUsersJun),
                SalesData('July', noOfUsersJul),
                SalesData('Aug', noOfUsersAug),
                SalesData('Sep', noOfUsersSep),
                SalesData('Oct', noOfUsersOct),
              ],
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales)
        ]))));
  }

  Future<int> getNoOfUsersNovember() async {
    print("Here");
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'user')
        .where('myDate', isEqualTo: '11')
        .get();
    final List<DocumentSnapshot> documents = result.docs;

    print(documents.length.toString() + "  " + "users");
    setState(() => noOfUsersNov = documents.length);
    return noOfUsersNov;
  }

  Future<int> getNoOfUsersDecember() async {
    print("Here");
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'user')
        .where('myDate', isEqualTo: '12')
        .get();
    final List<DocumentSnapshot> documents = result.docs;

    print(documents.length.toString() + "  " + "users");
    setState(() => noOfUsersDec = documents.length);
    return noOfUsersDec;
  }

  Future<int> getNoOfUsersJanuary() async {
    print("Here");
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'user')
        .where('myDate', isEqualTo: '1')
        .get();
    final List<DocumentSnapshot> documents = result.docs;

    print(documents.length.toString() + "  " + "users");
    setState(() => noOfUsersJan = documents.length);
    return noOfUsersJan;
  }

  Future<int> getNoOfUsersFebruary() async {
    print("Here");
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'user')
        .where('myDate', isEqualTo: '2')
        .get();
    final List<DocumentSnapshot> documents = result.docs;

    print(documents.length.toString() + "  " + "users");
    setState(() => noOfUsersFeb = documents.length);
    return noOfUsersFeb;
  }

  Future<int> getNoOfUsersMarch() async {
    print("Here");
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'user')
        .where('myDate', isEqualTo: '3')
        .get();
    final List<DocumentSnapshot> documents = result.docs;

    print(documents.length.toString() + "  " + "users");
    setState(() => noOfUsersMar = documents.length);
    return noOfUsersMar;
  }

  Future<int> getNoOfUsersApril() async {
    print("Here");
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'user')
        .where('myDate', isEqualTo: '4')
        .get();
    final List<DocumentSnapshot> documents = result.docs;

    print(documents.length.toString() + "  " + "users");
    setState(() => noOfUsersApr = documents.length);
    return noOfUsersApr;
  }

  Future<int> getNoOfUsersMay() async {
    print("Here");
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'user')
        .where('myDate', isEqualTo: '5')
        .get();
    final List<DocumentSnapshot> documents = result.docs;

    print(documents.length.toString() + "  " + "users");
    setState(() => noOfUsersMay = documents.length);
    return noOfUsersMay;
  }

  Future<int> getNoOfUsersJune() async {
    print("Here");
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'user')
        .where('myDate', isEqualTo: '6')
        .get();
    final List<DocumentSnapshot> documents = result.docs;

    print(documents.length.toString() + "  " + "users");
    setState(() => noOfUsersJun = documents.length);
    return noOfUsersJun;
  }

  Future<int> getNoOfUsersJuly() async {
    print("Here");
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'user')
        .where('myDate', isEqualTo: '7')
        .get();
    final List<DocumentSnapshot> documents = result.docs;

    print(documents.length.toString() + "  " + "users");
    setState(() => noOfUsersJul = documents.length);
    return noOfUsersJul;
  }

  Future<int> getNoOfUsersAugest() async {
    print("Here");
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'user')
        .where('myDate', isEqualTo: '8')
        .get();
    final List<DocumentSnapshot> documents = result.docs;

    print(documents.length.toString() + "  " + "users");
    setState(() => noOfUsersAug = documents.length);
    return noOfUsersAug;
  }

  Future<int> getNoOfUsersSeptemper() async {
    print("Here");
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'user')
        .where('myDate', isEqualTo: '9')
        .get();
    final List<DocumentSnapshot> documents = result.docs;

    print(documents.length.toString() + "  " + "users");
    setState(() => noOfUsersSep = documents.length);
    return noOfUsersSep;
  }

  Future<int> getNoOfUsersOctober() async {
    print("Here");
    final QuerySnapshot result = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'user')
        .where('myDate', isEqualTo: '10')
        .get();
    final List<DocumentSnapshot> documents = result.docs;

    print(documents.length.toString() + "  " + "users");
    setState(() => noOfUsersOct = documents.length);
    return noOfUsersOct;
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final int sales;
}
