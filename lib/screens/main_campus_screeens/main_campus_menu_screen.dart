import 'package:flutter/material.dart';

class MainCampusMenuScreen extends StatelessWidget {
  static const String routeName = '/main_campus';

  const MainCampusMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Campus"),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: const <Widget>[
              ListTile(
                title: Text("About Us"),
                leading: Icon(Icons.people_alt_outlined),
              ),
              ListTile(
                title: Text("Campus Map"),
                leading: Icon(Icons.map_outlined),
              ),
              ListTile(
                title: Text("Academic Calendar"),
                leading: Icon(Icons.calendar_month_outlined),
              ),
              ListTile(
                title: Text("List of Schools"),
                leading: Icon(Icons.school_outlined),
              ),
              ListTile(
                title: Text("List of Societies"),
                leading: Icon(Icons.person_pin_circle_outlined),
              )
            ],
          )),
      bottomNavigationBar: _bottomNavBar(),
    );
  }
}

BottomNavigationBar _bottomNavBar() {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      // Home Icon
      BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Colors.purple),
      // Explore Icon
      BottomNavigationBarItem(
        icon: Icon(Icons.explore_outlined),
        label: 'Explore',
        backgroundColor: Colors.blue,
      ),

      // Notification Icon
      BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none_outlined),
          label: 'Notifications',
          backgroundColor: Colors.red),

      // Profile Icon
      BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'User',
          backgroundColor: Colors.pink),
    ],
    currentIndex: 1,
    selectedItemColor: Colors.amber[800],
  );
}
