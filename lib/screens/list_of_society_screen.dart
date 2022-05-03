import 'package:flutter/material.dart';
import 'package:my_usm/screens/school_society_profile_screen.dart';
import 'package:my_usm/widgets/app_bar.dart';
import 'package:my_usm/widgets/bottom_nav_bar.dart';

class ListOfSociety extends StatelessWidget {
  final String name;
  final int index;
  static const String routeName = "/list_of_society";

  ListOfSociety({Key? key, required this.name, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpperNavBar(title: "$name's Society").build(context),
      body: getCampus(index),
      bottomNavigationBar: const BottomNavBar(curIndex: 1),
    );
  }

  /*
    List of societies. This will have to be updated from Firebase based on the 
    registered clubs in the app.
    For now, put in the known clubs as much as possible to make it look real
  */
  final List<String> mainCampusSociety = [
    "Computer Science Society",
    "Google Developer Students Club USM",
    "Microsoft Learn Student Ambassadors",
    "Japanese Club",
    "Chess Club"
  ];

  final List<String> healthCampusSociety = [
    // Input the name of societies here
  ];

  final List<String> engCampusSociety = [
    // Input the name of societies here
  ];

  Widget getCampus(int index) {
    switch (index) {

      // Main Campus school list
      case 0:
        return ListView.separated(
            padding: const EdgeInsets.all(10.0),
            itemCount: mainCampusSociety.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 39, 38, 53))),
                // Put image of school in leading
                // leading: ,
                title: Text(mainCampusSociety[index]),
                onTap: () {
                  Navigator.of(context).pushNamed(
                      SchoolSocietyProfile.routeName,
                      arguments: mainCampusSociety[index]);
                },
              );
            });

      // Health Campus school list
      case 1:
        return ListView.separated(
            padding: const EdgeInsets.all(10.0),
            itemCount: healthCampusSociety.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 39, 38, 53))),
                // leading:
                title: Text(healthCampusSociety[index]),
                onTap: () {
                  return;
                },
              );
            });

      // Engineering Campus school list
      case 2:
        return ListView.separated(
            padding: const EdgeInsets.all(10.0),
            itemCount: engCampusSociety.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 39, 38, 53))),
                // leading
                title: Text(engCampusSociety[index]),
                onTap: () {
                  return;
                },
              );
            });

      default:
        return Container(
          alignment: Alignment.center,
          child: const Text("Opps, nothing to show here."),
        );
    }
  }
}
