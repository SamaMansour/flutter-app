import 'package:flutter/material.dart';

import '../screens/category_trips_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl ;

  CategoryItem(this.id, this.title, this.imageUrl);

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
    '/category-trips',
        arguments:{
        'id': id,
        'title': title,

        }
    );
  }
  @override
  Widget build (BuildContext context){
    return InkWell(
      onTap:()=>selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      child: Stack(
        children : [
        Image.asset(imageUrl,height:250, fit: BoxFit.cover,),

          Container(
            
          
           
                        
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),

            decoration :BoxDecoration(
              color:Colors.black.withOpacity(0.3),
             

            ) ,

          )

        ]

      ),
    );
  }
}