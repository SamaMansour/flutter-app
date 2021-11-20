import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jordantimes_final/Widgets/user_drawer.dart';
import 'package:jordantimes_final/screens/Categories_screen.dart';
import 'package:jordantimes_final/screens/Search_Screen.dart';
import 'package:jordantimes_final/screens/favorite_screen.dart';
import 'package:jordantimes_final/screens/user_profile_screen.dart';
import 'package:jordantimes_final/screens/welcome_screen.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);


  
  

  @override
  _UserScreenState createState() => _UserScreenState();

  
}

class _UserScreenState extends State<UserScreen> {

   void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  final List<Widget> _screens = [Categoriesscreen(),
  SearchScreen(),
  favoriteScreen(),
  UserProfile(),
  
  


  ];
  
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      
      body: _screens[_selectedScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.red,
          
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favourite'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        )
    );
  }


 
}
 


