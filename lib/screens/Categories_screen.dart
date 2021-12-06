import 'package:flutter/material.dart';
import 'package:jordantimes_final/Widgets/category_item.dart';
import 'package:jordantimes_final/Widgets/main_drawer.dart';
import '../Widgets/app_data.dart';
class Categoriesscreen extends StatelessWidget{
  @override
  Widget build (BuildContext context ){
    return Scaffold(
      appBar:AppBar(
        title:Text('JordanTimes')
      ),
      drawer: MainDrawer(),

      //Category Grid
     
        body:GridView(
          padding: EdgeInsets.all(10),
        gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 7/8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10

        ),
        //Category Widget
          children: Categories_data.map((categoryData)=>
              CategoryItem(categoryData.id, categoryData.title, categoryData.imageUrl)
          ).toList(),

      ),
    );
  }
}
