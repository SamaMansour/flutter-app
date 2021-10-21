import 'package:flutter/material.dart';

class LocationsScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(
        title: Text('Locations'),
      ),

           body:Container(
              
             decoration:BoxDecoration(color:Colors.white,
             borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0), topRight:Radius.circular(20.0))
             ),
             child: ListView(
               children: <Widget>[
                 ListTile(
                   title:Text('Amman'),
                   trailing: Checkbox(value: false,onChanged: null,),

                 ),

                 

                 ListTile(
                   title:Text('Aqaba'),
                   trailing: Checkbox(value: false,onChanged: null,),

                 ),

                 ListTile(
                   title:Text('Balqaa'),
                   trailing: Checkbox(value: false,onChanged: null,),

                 ),


                 ListTile(
                   title:Text('Irbid'),
                   trailing: Checkbox(value: false,onChanged: null,),

                 ),
                 ListTile(
                   title:Text('Madaba'),
                   trailing: Checkbox(value: false,onChanged: null,),

                 ),
                 ListTile(
                   title:Text('Maan'),
                   trailing: Checkbox(value: false,onChanged: null,),

                 ),
                 ListTile(
                   title:Text('Tafila'),
                   trailing: Checkbox(value: false,onChanged: null,),

                 ),
                 ListTile(
                   title:Text('Mafraq'),
                   trailing: Checkbox(value: false,onChanged: null,),

                 ),
                 ListTile(
                   title:Text('Zarqa'),
                   trailing: Checkbox(value: false,onChanged: null,),

                 ),
                 ListTile(
                   title:Text('Ajloun'),
                   trailing: Checkbox(value: false,onChanged: null,),

                 ),
                 ListTile(
                   title:Text('Karak'),
                   trailing: Checkbox(value: false,onChanged: null,),

                 ),
                 ListTile(
                   title:Text('Jarash'),
                   trailing: Checkbox(value: false,onChanged: null,),

                 ),

               ],
             )
           
        ),
      
      
     


     
      
    );
  }
}