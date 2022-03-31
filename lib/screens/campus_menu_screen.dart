import 'package:flutter/material.dart';

import './campus_about_us_screen.dart';
import './campus_map_screen.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_nav_bar.dart';
import 'package:my_usm/screens/academic_calendar_screen.dart';
import 'package:my_usm/screens/campus_about_us_screen.dart';
import 'package:my_usm/widgets/app_bar.dart';
import 'package:my_usm/widgets/bottom_nav_bar.dart';

class CampusMenuScreen extends StatelessWidget {
  static const String routeName = '/campus_menu';

  final String name;
  final int index;

  /*
    name is the name of the menu which will be displayed on the Appbar.
    index is the index of which campus's screen to got to.
    0 for main campus, 1 for engineering campus, and 2 for health campus
  */
  const CampusMenuScreen({
    Key? key,
    required this.name,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpperNavBar(title: name).build(context),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              ListTile(
                title: const Text("About Us"),
                leading: const Icon(Icons.people_alt_outlined),
                onTap: () {
                  Navigator.of(context).pushNamed(CampusAboutUs.routeName,
                      arguments: [name, index]);
                },
              ),
              ListTile(
                title: const Text("Campus Map"),
                leading: const Icon(Icons.map_outlined),
                // Pushes the map screen
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(CampusMapScreen.routeName, arguments: name);
                },
              ),
              ListTile(
                title: const Text("Academic Calendar"),
                leading: const Icon(Icons.calendar_month_outlined),
                /*
                  Defines the file path of the PDF Academic Calendar and pushes 
                  the screen
                */
                onTap: () async {
                  const path =
                      "assets/KALENDAR_AKADEMIK_2021_2022_28012022_1.pdf";

                  Navigator.of(context)
                      .pushNamed(AcademicCalendar.routeName, arguments: path);
                },
              ),
              ListTile(
                title: const Text("List of Schools"),
                leading: const Icon(Icons.school_outlined),
                // TODO: Add the onTap function here
                onTap: () {
                  return;
                },
              ),
              ListTile(
                title: const Text("List of Societies"),
                leading: const Icon(Icons.person_pin_circle_outlined),
                // TODO: Add the onTap function here
                onTap: () {
                  return;
                },
              )
            ],
          )),
      bottomNavigationBar: const BottomNavBar(curIndex: 1),
    );
  }
}
