import 'package:flutter/material.dart';
import 'package:my_usm/widgets/app_bar.dart';
import 'package:my_usm/widgets/campus_tile.dart';
import 'package:my_usm/widgets/side_menu.dart';

import '../widgets/bottom_nav_bar.dart';
import 'campus_menu_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);
  static const String routeName = '/explore';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperNavBar(title: "Explore").build(context),
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
                              CampusMenuScreen.routeName,
                              arguments: ["Main Campus", 0]
                            );
                          },
                        ),
                        InkWell(
                          child: const CampusTile(
                              name: "Health Campus",
                              image: "assets/images/medical_campus.jpg"),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              CampusMenuScreen.routeName,
                              arguments: ["Health Campus", 1]
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
                              CampusMenuScreen.routeName,
                              arguments: ["Engineering Campus", 2]
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
      bottomNavigationBar: const BottomNavBar(curIndex: 1),
    );
  }
}