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
      backgroundColor: const Color.fromARGB(230, 39, 38, 53),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 150,
            child: DrawerHeader(
              child: InkWell(
                child: const Text(
                  'MyUSM',
                  style: TextStyle(
                    color: Color.fromARGB(255, 243, 239, 245),
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),
                ),
                /* 
                  Pop screens all the way to Home Screen.
                  So whenever the user is at Home Screen and taps back button,
                  it will exit the app directly.
                */
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(HomeScreen.routeName);
                },
              ),
          )
          ,
          ),
          ListTile(
              leading: const Icon(
                Icons.home_outlined,
                color: Color.fromARGB(255, 243, 239, 245),
              ),
              title: const Text(
                "Home",
                style: TextStyle(
                  color: Color.fromARGB(255, 243, 239, 245)
                ),
              ),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName);
              }),
          ListTile(
            leading: const Icon(
              Icons.person_outline,
              color: Color.fromARGB(255, 243, 239, 245),
            ),
            title: const Text(
              'Profile',
              style: TextStyle(
                color: Color.fromARGB(255, 243, 239, 245)
              ),
            ),

            // TODO: change this to their respective pages
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SocietyScreen(
                          title: 'CS Soc',
                        ))),
          ),
          ListTile(
              leading: const Icon(
                Icons.explore_outlined,
                color: Color.fromARGB(255, 243, 239, 245),
              ),
              title: const Text(
                'Explore',
                style: TextStyle(
                  color: Color.fromARGB(255, 243, 239, 245)
                ),
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed(ExploreScreen.routeName)),
          ListTile(
            leading: const Icon(
              Icons.question_answer_outlined,
              color: Color.fromARGB(255, 243, 239, 245),
            ),
            title: const Text(
              'FAQ',
              style: TextStyle(
                color: Color.fromARGB(255, 243, 239, 245)
              ),
            ),
            // TODO: change this to their respective pages
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SocietyScreen(
                          title: 'CS Soc',
                        ))),
          ),
          ListTile(
            leading: const Icon(
              Icons.logout_outlined,
              color: Color.fromARGB(255, 243, 239, 245),
            ),
            title: const Text(
              'Logout',
              style: TextStyle(
                color: Color.fromARGB(255, 243, 239, 245)
              ),
            ),
            onTap: () => Provider.of<User>(context, listen: false).logout(),
          ),
        ],
      ),
    );
  }
}
