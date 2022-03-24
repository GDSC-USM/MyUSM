import 'package:flutter/material.dart';
import 'package:my_usm/widgets/side_menu.dart';

int selectedIndex = 0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MyUSM")),
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
      bottomNavigationBar: _bottomNavBar(), // declared below
    );
  }
}

// Extracted into a function for ease of use
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
    selectedItemColor: Colors.amber[800],
  );
}

// Change screen based on icon tapped on bottom nav bar
void onItemTapped(int index, BuildContext context) {
  switch (index) {
    case 0:
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      break;
    case 1:
      // TODO: Change to explore page once created
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      break;
    case 2:
      // TODO: Change to notification page once created
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      break;
    case 3:
      // TODO: Change to profile page once created
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      break;
  }
}
