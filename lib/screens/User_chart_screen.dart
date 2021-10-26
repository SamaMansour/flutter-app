import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class UserChart extends StatefulWidget {
  @override
  _UserChartState createState() => _UserChartState();
}

class _UserChartState extends State<UserChart> {
  late List<UsersData> _chartData;
  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Charts'),
      ),
      body: SfCartesianChart(
        series: <ChartSeries>[
          LineSeries<UsersData, double>(
              dataSource: _chartData,
              xValueMapper: (UsersData users, _) => users.month,
              yValueMapper: (UsersData users, _) => users.users)
        ],
        primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
      ),
    ));
  }
}final _firestore = FirebaseFirestore.instance;





var usersNum = countDocuments();
List<UsersData> getChartData() {
  final List<UsersData> chartData = [
    UsersData(1, usersNum as double),
    UsersData(2, usersNum as double),
    UsersData(3, usersNum as double),
    UsersData(4, usersNum as double),
  ];
  return chartData;
}



countDocuments() async {
  QuerySnapshot _myDoc = await _firestore.collection('users').get();
  List<DocumentSnapshot> _myDocCount = _myDoc.docs;
  return _myDocCount.length; // Count of Documents in Collection
}

class UsersData {
  UsersData(this.month, this.users);

  final double month;
  final double users;
}
