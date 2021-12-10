import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/screens/Goverment_History.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';

class RejectedCompanies extends StatefulWidget {
  const RejectedCompanies({ Key? key }) : super(key: key);

  @override
  _RejectedCompaniesState createState() => _RejectedCompaniesState();
}

class _RejectedCompaniesState extends State<RejectedCompanies> {
    final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Declined Companies'),
      ),
    


      
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<QuerySnapshot>(
              
                stream: _firestore.collection('declined').snapshots(),
                builder: (context, snapshot) {
                  List<ItemLineOne> companiesWidgets = [];
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator(
                      backgroundColor: Colors.red,
                    );
                  }
                  //Stream Rejected Companies 

                  final companies = snapshot.data!.docs;
                  for (var company in companies) {
                  
                      final no = company.get('number');
                      final name = company.get('name');
                      final status = company.get('verfied');

                      final companyWidget = ItemLineOne(
                        no: no,
                        name: name,
                        status: status,
                      );

                      companiesWidgets.add(companyWidget);
                    
                  }
                  return Expanded(
                    child: ListView(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 24),
                      children: companiesWidgets,
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}