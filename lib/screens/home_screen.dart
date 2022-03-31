import 'package:flutter/material.dart';
import 'package:my_usm/widgets/bottom_nav_bar.dart';
import 'package:my_usm/widgets/side_menu.dart';
import 'package:my_usm/widgets/app_bar.dart';

int selectedIndex = 0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 239, 245),
      appBar: const UpperNavBar(title: "Home").build(context),
      // Add more details to this when you decide what the drawer will do
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, // one page size area
          children: <Widget>[
            // Replace this with a detail item once you decide what it will contain
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey,
            ),

            const Text('Your updates'),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                // Could be placed in another list and then mapped
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 400,
                    color: Colors.pink,
                    child: const Text("News/Announcement posts go here"),
                    margin: const EdgeInsets.all(10.0),
                  ),
                  Container(
                    width: double.infinity,
                    height: 400,
                    color: Colors.pink,
                    child: const Text("News/Announcement posts go here"),
                    margin: const EdgeInsets.all(10.0),
                  ),
                  Container(
                    width: double.infinity,
                    height: 400,
                    color: Colors.pink,
                    child: const Text("News/Announcement posts go here"),
                    margin: const EdgeInsets.all(10.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(curIndex: 0), // declared below
    );
  }
}
