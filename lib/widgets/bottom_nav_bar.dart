import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      // Home Icon
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.purple),
      // Explore Icon
      BottomNavigationBarItem(
        icon: Icon(Icons.explore_outlined),
        label: 'Explore',
        backgroundColor: Colors.blue,
      ),

      // Notification Icon
      BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none_outlined),
          label: 'Notifications',
          backgroundColor: Colors.red),

      // Profile Icon
      BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'User',
          backgroundColor: Colors.pink),
    ],
    
    // TODO: Figure a way to change the index based on which screen is displayed
    currentIndex: 1,
    selectedItemColor: Colors.amber[800],
  );
  }
}