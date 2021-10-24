import 'package:flutter/material.dart';
import 'package:jordantimes_final/Widgets/admin_drawer.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
      ),

      drawer: AdminDrawer(),
    );
  }
}
