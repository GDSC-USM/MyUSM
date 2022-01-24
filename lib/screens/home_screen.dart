import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/campus_tile.dart';
import '../providers/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // Add more details to this when you decide what the drawer will do
      drawer: Drawer(
        child: ElevatedButton(
          onPressed: () => Provider.of<User>(context, listen: false).logout(),
          child: const Text('Log out'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // one page size area
        children: <Widget>[
          const Text('Student Details'),
          // Replace this with a detail item once you decide what it will contain
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.grey,
          ),
          const Text('Campus'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              // Could be placed in another list and then mapped
              children: const <Widget>[
                CampusTile(
                  name: 'Main campus',
                  image: 'assets/images/main_campus.jpg',
                ),
                CampusTile(
                  name: 'Engineering campus',
                  image: 'assets/images/engineering_campus.jpg',
                ),
                CampusTile(
                  name: 'Medical campus',
                  image: 'assets/images/medical_campus.jpg',
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomNavBar(), // declared down
    );
  }
}

// Extracted into a function for ease of use
BottomNavigationBar _bottomNavBar() {
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'User',
      ),
    ],
  );
}
