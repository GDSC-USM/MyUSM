import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_usm/screens/campus_about_us_screen.dart';
import 'package:my_usm/screens/campus_menu_screen.dart';
import 'package:my_usm/screens/explore_screen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import './screens/selector_screen.dart';
import './screens/home_screen.dart';
import './screens/campus_screen.dart';
import './screens/school_screen.dart';
import './screens/society_screen.dart';
import './providers/user.dart';
import './providers/posts.dart';

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
    return MultiProvider(
      providers: [
        ListenableProvider<User>(create: (context) => User()),
        Provider<Posts>(create: (context) => Posts()),
      ],
      child: MaterialApp(
        // The routes table
        routes: {
          '/': (ctx) => const SelectorScreen(),
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          ExploreScreen.routeName: (ctx) => const ExploreScreen()
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
            /*
                Because these cases has multiple arguments, so I fetched all the
                arguments as a list, then assigned them to to their respective
                attributes.
              */
            case CampusMenuScreen.routeName:
              List<dynamic> args = settings.arguments as List<dynamic>;
              return MaterialPageRoute(builder: (ctx) {
                return CampusMenuScreen(name: args[0], index: args[1]);
              });
            case CampusAboutUs.routeName:
              List<dynamic> args = settings.arguments as List<dynamic>;
              return MaterialPageRoute(builder: (ctx) {
                return CampusAboutUs(name: args[0], index: args[1]);
              });
            default:
              return null;
          }
        },
      ),
    );
  }
}
