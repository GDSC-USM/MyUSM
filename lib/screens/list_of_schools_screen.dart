import 'package:flutter/material.dart';
import 'package:my_usm/widgets/app_bar.dart';
import 'package:my_usm/widgets/bottom_nav_bar.dart';

class ListOfSchool extends StatelessWidget {
  final String name;
  final int index;
  static const String routeName = "/list_of_schools";

  ListOfSchool({Key? key, required this.name, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpperNavBar(title: "$name's Schools").build(context),
      body: getCampus(index),
      bottomNavigationBar: const BottomNavBar(curIndex: 1),
    );
  }

  /*
    List of schools in each respective campus.
    Used in the List View builder
  */
  final List<String> mainCampusSchool = [
    "Arts",
    "Biological Sciences",
    "Communication",
    "Chemical Sciences",
    "Computer Sciences",
    "Distance Education",
    "Educational Studies",
    "Housing, Building and Planning",
    "Humanities",
    "Industrial Technology",
    "Management",
    "Mathematical Sciences",
    "Pharmaceutical Sciences",
    "Physics",
    "Social Sciences"
  ];

  final List<String> healthCampusSchool = [
    "Dental Sciences",
    "Health Sciences",
    "Medical Sciences",
  ];

  final List<String> engCampusSchool = [
    "Civil Engineering",
    "Electrical & Electronic Engineering",
    "Aerospace Engineering",
    "Chemical Engineering",
    "Mechanical Engineering",
    "Materials & Mineral Resources Engineering"
  ];

  Widget getCampus(int index) {
    switch (index) {

      // Main Campus school list
      case 0:
        return ListView.separated(
            padding: const EdgeInsets.all(10.0),
            itemCount: mainCampusSchool.length,
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
                title: Text("School of " + mainCampusSchool[index]),
                onTap: () {
                  return;
                },
              );
            });

      // Health Campus school list
      case 1:
        return ListView.separated(
            padding: const EdgeInsets.all(10.0),
            itemCount: healthCampusSchool.length,
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
                      color: Color.fromARGB(255, 39, 38, 53)
                    )
                ),
                // leading:
                title: Text("School of " + healthCampusSchool[index]),
                onTap: () {
                  return;
                },
              );
            });

      // Engineering Campus school list
      case 2:
        return ListView.separated(
            padding: const EdgeInsets.all(10.0),
            itemCount: engCampusSchool.length,
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
                      color: Color.fromARGB(255, 39, 38, 53)
                    )
                ),
                // leading
                title: Text("School of " + engCampusSchool[index]),
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
