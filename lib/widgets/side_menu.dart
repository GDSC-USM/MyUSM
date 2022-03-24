import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user.dart';
import '../screens/explore_screen.dart';
import '../screens/home_screen.dart';
import '../screens/society_screen.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: InkWell(
              child: const Text(
                'MyUSM',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              /* 
                Pop screens all the way to Home Screen.
                So whenever the user is at Home Screen and taps back button,
                it will exit the app directly.

                24/3/2022
                - This method is still buggy, sometimes it returns to the
                  HomeScreen, sometimes it returns to a black screen
              */
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              },
            ),
            // TODO: Replace or make the image look better if possible
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/app_bar_image.jpg"))),
          ),
          ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text("Home"),
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(HomeScreen.routeName)),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Profile'),

            // TODO: change this to their respective pages
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SocietyScreen(
                          title: 'CS Soc',
                        ))),
          ),
          ListTile(
              leading: const Icon(Icons.explore_outlined),
              title: const Text('Explore'),
              onTap: () =>
                  Navigator.of(context).pushNamed(ExploreScreen.routeName)),
          ListTile(
            leading: const Icon(Icons.question_answer_outlined),
            title: const Text('FAQ'),
            // TODO: change this to their respective pages
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SocietyScreen(
                          title: 'CS Soc',
                        ))),
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text('Logout'),
            onTap: () => Provider.of<User>(context, listen: false).logout(),
          ),
        ],
      ),
    );
  }
}
