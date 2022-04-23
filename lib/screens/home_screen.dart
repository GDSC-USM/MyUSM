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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    // Replace this with a detail item once you decide what it will contain
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      color: Colors.orange[index * 100],
                    );
                  },
                ),
            ),
          ),

          const SliverToBoxAdapter(
            child: Text(
              "Your Updates",
              style: TextStyle(
                color: Color.fromARGB(255, 39, 38, 53),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          SliverToBoxAdapter(
            child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: double.infinity,
                      height: 400,
                      color: Colors.pink,
                      child: const Text("News/Announcement posts go here"),
                      margin: const EdgeInsets.all(10.0),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                )
          )
        ]
      ),
      bottomNavigationBar: const BottomNavBar(curIndex: 0), // declared below
    );
  }
}
