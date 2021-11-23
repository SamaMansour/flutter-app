import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReservationDetails extends StatelessWidget {
  const ReservationDetails({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
     
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
      TextFormField(
      textAlign: TextAlign.center,
      
      decoration: InputDecoration(
        hintText: 'Name ',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    ),

    SizedBox(height: 8.0),



    TextFormField(
      textAlign: TextAlign.center,
      
      decoration: InputDecoration(
        hintText: 'Age ',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    ),

     SizedBox(height: 8.0),


     TextFormField(
      textAlign: TextAlign.center,
      
      decoration: InputDecoration(
        hintText: 'Phone',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    ),


    SizedBox(height: 8.0),


    TextFormField(
      textAlign: TextAlign.center,
      
      decoration: InputDecoration(
        hintText: 'National ID ',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    ),


    









            ],
            
          ),
        ),
      ),
    );
  }

 
  }

 
      
  