import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/models/userModel.dart';
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








List<UsersData> getChartData() {
  final List<UsersData> chartData = [
    UsersData(1, 100),
    UsersData(2, 200),
    UsersData(3, 300),
    UsersData(4, 400),
  ];
  return chartData;
}






 

class UsersData {
  UsersData(this.month, this.users);

  final double month;
  final int users;
}
