import 'package:flutter/material.dart';
import 'package:jordantimes_final/screens/Categories_screen.dart';
import './Categories_screen.dart';
import 'favorite_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  final List<Widget> _screens = [Categoriesscreen(),
  favoriteScreen()];
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
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favourite'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ));
  }
}
