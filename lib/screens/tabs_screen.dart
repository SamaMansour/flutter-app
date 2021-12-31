import 'package:flutter/material.dart';
import 'package:jordantimes_final/screens/Categories_screen.dart';
import 'package:jordantimes_final/screens/Company_screen.dart';
import 'package:jordantimes_final/screens/Goverment_screen.dart';
import 'package:jordantimes_final/screens/Search_Screen.dart';
import 'package:jordantimes_final/screens/User_screen.dart';
import 'package:jordantimes_final/screens/welcome_screen.dart';
import './Categories_screen.dart';


class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  static var locations;

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  final List<Widget> _screens = [Categoriesscreen(),
  SearchScreen(),
  WelcomeScreen(),
  


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        body: _screens[_selectedScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.red,
          currentIndex: _selectedScreenIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
           
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ));
  }
}
