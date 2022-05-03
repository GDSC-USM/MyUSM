import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_usm/screens/academic_calendar_screen.dart';
import 'package:my_usm/screens/campus_about_us_screen.dart';
import 'package:my_usm/screens/campus_menu_screen.dart';
import 'package:my_usm/screens/explore_screen.dart';
import 'package:my_usm/screens/faq_screen.dart';
import 'package:my_usm/screens/list_of_schools_screen.dart';
import 'package:my_usm/screens/list_of_society_screen.dart';
import 'package:my_usm/screens/notification_screen.dart';
import 'package:my_usm/screens/profile_edit_screen.dart';
import 'package:my_usm/screens/profile_screen.dart';
import 'package:my_usm/screens/school_society_edit_screen.dart';
import 'package:my_usm/screens/school_society_profile_screen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import './screens/selector_screen.dart';
import './screens/home_screen.dart';
import './screens/campus_map_screen.dart';
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
        ListenableProvider<Posts>(create: (context) => Posts()),
      ],
      child: MaterialApp(
        // The routes table
        routes: {
          '/': (ctx) => const SelectorScreen(),
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          ExploreScreen.routeName: (ctx) => const ExploreScreen(),
          FAQ.routeName: (ctx) => const FAQ(),
          NotificationScreen.routeName: (ctx) => const NotificationScreen(),

          /*
            These two routes may need to go to onGenerateRoute, but since 
            database is not yet set up, everything is still constant
          */
          Profile.routeName: (ctx) => const Profile(),
          EditProfile.routeName: (ctx) => const EditProfile(),
          SchoolSocietyEdit.routeName: (ctx) => const SchoolSocietyEdit()
        },
        // The generate route table for the case where the pages need some arguments
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case AcademicCalendar.routeName: // Academic Calendar Page
              return MaterialPageRoute(
                  builder: (ctx) =>
                      AcademicCalendar(file: settings.arguments as String));
            case CampusMapScreen.routeName: // Campus Map Page
              return MaterialPageRoute(
                  builder: (ctx) =>
                      CampusMapScreen(title: settings.arguments as String));
            case SchoolSocietyProfile.routeName:
              return MaterialPageRoute(
                  builder: (ctx) => SchoolSocietyProfile(
                      title: settings.arguments as String));

            /*
                Because these cases has multiple arguments, so I fetched all the
                arguments as a list, then assigned them to to their respective
                attributes.
            */
            case CampusMenuScreen.routeName: // Campus Menu Page
              List<dynamic> args = settings.arguments as List<dynamic>;
              return MaterialPageRoute(
                  builder: (ctx) =>
                      CampusMenuScreen(name: args[0], index: args[1]));
            case CampusAboutUs.routeName: // Campus About Us Page
              List<dynamic> args = settings.arguments as List<dynamic>;
              return MaterialPageRoute(
                  builder: (ctx) =>
                      CampusAboutUs(name: args[0], index: args[1]));
            case ListOfSchool.routeName: // List of School page
              List<dynamic> args = settings.arguments as List<dynamic>;
              return MaterialPageRoute(
                  builder: (ctx) =>
                      ListOfSchool(name: args[0], index: args[1]));
            case ListOfSociety.routeName:
              List<dynamic> args = settings.arguments as List<dynamic>;
              return MaterialPageRoute(
                  builder: (ctx) =>
                      ListOfSociety(name: args[0], index: args[1]));
            default:
              return null;
          }
        },
      ),
    );
  }
}
