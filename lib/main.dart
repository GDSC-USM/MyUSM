import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import './screens/selector_screen.dart';
import './screens/home_screen.dart';
import './screens/campus_screen.dart';
import './screens/school_screen.dart';
import './screens/society_screen.dart';
import './providers/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Providing the User class at the top of the app downwards
    return ChangeNotifierProvider(
      create: (context) => User(),
      child: MaterialApp(
        // The routes table
        routes: {
          '/': (ctx) => const SelectorScreen(),
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
      ),
    );
  }
}
