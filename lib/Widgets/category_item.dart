import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../screens/category_trips_screen.dart';

class CategoryItem extends StatefulWidget {
  final String id;
  final String title;
  final String imageUrl ;

  CategoryItem(this.id, this.title, this.imageUrl);

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
    '/category-trips',
        arguments:{
        'id': widget.id,
        'title': widget.title,

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
        Image.asset(widget.imageUrl,height:250, fit: BoxFit.cover,),

          Container(
            
          
           
                        
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              widget.title,
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