import 'package:flutter/material.dart';

class GovermentHistory extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.check)),
                Tab(icon: Icon(Icons.close)),
             
              ],
            ),
            title: const Text('History'),
          ),
          body: const TabBarView(
            children: [
              Icon(Icons.check),
              Icon(Icons.close),
            
            ],
          ),


      
    );
  }
}