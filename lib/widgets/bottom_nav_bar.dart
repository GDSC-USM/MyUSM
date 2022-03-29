import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int curIndex;

  const BottomNavBar({
    Key? key,
    required this.curIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromARGB(255, 39, 38, 53),
      unselectedItemColor: const Color.fromARGB(255, 243, 239, 245),
      selectedItemColor: const Color.fromARGB(255, 255, 127, 17),

      items: const <BottomNavigationBarItem>[
        // Home Icon
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
        ),
        // Explore Icon
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          label: 'Explore',
        ),

        // Notification Icon
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_outlined),
            label: 'Notifications',
        ),

        // Profile Icon
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
        ),
      ],
      // TODO: Figure a way to change the index based on which screen is displayed
      currentIndex: curIndex,
    );
  }
}
