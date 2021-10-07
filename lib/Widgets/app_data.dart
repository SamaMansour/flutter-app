import 'package:flutter/material.dart';
import 'package:jordantimes_final/models/Category.dart';
import 'package:jordantimes_final/models/Trip.dart';

import '../models/Category.dart';
import '../models/Trip.dart';
const Categories_data = const[
  Category(
    id: 'c1',
    title:'Amman',
    imageUrl:'assets/amman.png'

  ),

  Category(
      id: 'c2',
      title:'Ajloun',
      imageUrl:'assets/ajloun.png'

  ),


  Category(
      id: 'c3',
      title:'Azraq',
      imageUrl:'assets/azraq.png'

  ),


  Category(
      id: 'c4',
      title:'Aqaba',
      imageUrl:'assets/aqaba.png'

  ),

  Category(
      id: 'c5',
      title:'Petra',
      imageUrl:'assets/petra.png'

  ),


  Category(
      id: 'c6',
      title:'Irbid',
      imageUrl:'assets/irbid.png'

  )
];


const Trips_data = const [
  Trip (
    id: 'm1',
    categories: ['c1'],
    title: 'Amman Trip',
    imageUrl: 'assets/ammanOffer.png',
    activities: ['climb',
        'lazertag'],
    program: ['trip tour'],
    duration: 3,
    tripType: TripType.Exploration,
    price : 10,


  ),


  Trip (
    id: 'm2',
    categories: ['c6'],
    title: 'Jarash Trip',
    imageUrl: 'assets/jarashOffer.png',
    activities: ['tour', 'festival', 'breakfast',],
    program: ['trip tour'],
    duration: 3,
    tripType: TripType.Exploration,
    price: 20,


  ),

];