import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:jordantimes_final/models/Trip.dart';
import 'package:jordantimes_final/screens/trip_ditail_screen.dart';

class TripItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int description;
 
  final int price;

  TripItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.price,
  });
  void selectTrip(BuildContext context) {
    Navigator.of(context).pushNamed('/trip-detail');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTrip(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                    height: 250,
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.black.withOpacity(0.5),
                        ])),
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 32),
                      overflow: TextOverflow.fade,
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$description Days'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.money,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$price JD'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
