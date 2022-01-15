import 'package:flutter/material.dart';

import './screens/login_screen.dart';
import './screens/home_screen.dart';
import './screens/campus_screen.dart';
import './screens/school_screen.dart';
import './screens/society_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // The routes table
      routes: {
        '/': (ctx) => LoginScreen(),
        HomeScreen.routeName: (ctx) => const HomeScreen(),
      },

      // The generate route table for the case where the pages need some arguments
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case CampusScreen.routeName: // Campus Page
            return MaterialPageRoute(
                builder: (ctx) =>
                    CampusScreen(title: settings.arguments as String));
          case SocietyScreen.routeName: // Society Page
            return MaterialPageRoute(
                builder: (ctx) =>
                    SocietyScreen(title: settings.arguments as String));
          case SchoolScreen.routeName: // School Page
            return MaterialPageRoute(
                builder: (ctx) =>
                    SchoolScreen(title: settings.arguments as String));
          default:
        }
      },
    );
  }
}
