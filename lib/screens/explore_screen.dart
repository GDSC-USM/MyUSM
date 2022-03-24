import 'package:flutter/material.dart';
import 'package:my_usm/screens/main_campus_screeens/main_campus_menu_screen.dart';
import 'package:my_usm/screens/health_campus_screeens/health_campus_menu_screen.dart';
import 'package:my_usm/screens/eng_campus_screeens/eng_campus_menu_screen.dart';
import 'package:my_usm/widgets/campus_tile.dart';
import 'package:my_usm/widgets/side_menu.dart';

import '../widgets/bottom_nav_bar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);
  static const String routeName = '/explore';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Explore"),
      ),
      drawer: const SideMenu(),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
                child: Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        InkWell(
                          child: const CampusTile(
                              name: "Main Campus",
                              image: "assets/images/main_campus.jpg"),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              MainCampusMenuScreen.routeName,
                            );
                          },
                        ),
                        InkWell(
                          child: const CampusTile(
                              name: "Health Campus",
                              image: "assets/images/medical_campus.jpg"),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              HealthCampusMenuScreen.routeName,
                            );
                          },
                        ),
                        InkWell(
                          child: const CampusTile(
                            name: "Engineering Campus",
                            image: "assets/images/engineering_campus.jpg",
                          ),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              EngCampusMenuScreen.routeName,
                            );
                          },
                        ),
                      ],
                    ))),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, index) {
                  // This is where to update the image from Firebase
                  return Container(
                    alignment: Alignment.center,
                    child: Text("Post data goes here, $index"),
                    color: Colors.pink.shade300,
                  );
                },
                childCount: 20,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}