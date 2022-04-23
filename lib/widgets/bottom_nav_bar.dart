import 'package:flutter/material.dart';
import 'package:my_usm/screens/explore_screen.dart';
import 'package:my_usm/screens/home_screen.dart';
import 'package:my_usm/screens/notification_screen.dart';
import 'package:my_usm/screens/profile_screen.dart';

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
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
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
      onTap: (index) {
        switch (index) {

          // Home button
          case 0:
            Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            break;
          // Explore button
          case 1:
            Navigator.of(context).pushNamed(ExploreScreen.routeName);
            break;
          // Notification button
          case 2:
            Navigator.of(context).pushNamed(NotificationScreen.routeName);
            break;
          // Profile button
          case 3:
            Navigator.of(context).pushNamed(Profile.routeName);
            break;

          default:
        }
      },
      currentIndex: curIndex,
    );
  }
}
