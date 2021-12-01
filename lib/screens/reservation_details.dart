import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReservationDetails extends StatelessWidget {
  const ReservationDetails({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Add Members')),
         resizeToAvoidBottomInset: false,
          body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
          child : Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              // First Component Shown
      TextFormField(
      textAlign: TextAlign.center,
      
      decoration: InputDecoration(
        hintText: 'Name ',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        
      ),
    ),

    SizedBox(height: 8.0),



    TextFormField(
      textAlign: TextAlign.center,
      
      decoration: InputDecoration(
        hintText: 'Age ',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        
      ),
    ),

     SizedBox(height: 8.0),


     TextFormField(
      textAlign: TextAlign.center,
      
      decoration: InputDecoration(
        hintText: 'Phone',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        
      ),
    ),


    SizedBox(height: 8.0),


    TextFormField(
      textAlign: TextAlign.center,
      
      decoration: InputDecoration(
        hintText: 'National ID ',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        
      ),
    ),

    SizedBox(height:16.0),
//Second Component Shown 

     TextFormField(
      textAlign: TextAlign.center,
      
      decoration: InputDecoration(
        hintText: 'Name ',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        
      ),
    ),

    SizedBox(height: 8.0),



    TextFormField(
      textAlign: TextAlign.center,
      
      decoration: InputDecoration(
        hintText: 'Age ',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
       
      ),
    ),

     SizedBox(height: 8.0),


     TextFormField(
      textAlign: TextAlign.center,
      
      decoration: InputDecoration(
        hintText: 'Phone',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        
      ),
    ),


    SizedBox(height: 8.0),


    TextFormField(
      textAlign: TextAlign.center,
      
      decoration: InputDecoration(
        hintText: 'National ID ',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        
      ),
    ),
 SizedBox(height:16.0),

 // Third Component Shown

     TextFormField(
      textAlign: TextAlign.center,
      
      decoration: InputDecoration(
        hintText: 'Name ',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        
      ),
    ),

    SizedBox(height: 8.0),



    TextFormField(
      textAlign: TextAlign.center,
      
      decoration: InputDecoration(
        hintText: 'Age ',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        
      ),
    ),

     SizedBox(height: 8.0),


     TextFormField(
      textAlign: TextAlign.center,
      
      decoration: InputDecoration(
        hintText: 'Phone',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        
      ),
    ),


    SizedBox(height: 8.0),


    TextFormField(
      textAlign: TextAlign.center,
      
      decoration: InputDecoration(
        hintText: 'National ID ',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        
      ),
    ),

    //Fourth Component Shown 
  SizedBox(height: 16.0),

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
      ),
    );
  }

 
  }

 
      
  