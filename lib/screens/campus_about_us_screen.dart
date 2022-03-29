import 'package:flutter/material.dart';
import 'package:my_usm/widgets/app_bar.dart';
import 'package:my_usm/widgets/bottom_nav_bar.dart';

class CampusAboutUs extends StatelessWidget {
  static const String routeName = "/campus_about_us";
  final String name;
  final int index;

  const CampusAboutUs({Key? key, required this.name, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpperNavBar(title: "About $name").build(context),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical, child: getCampus(index, context)),
      bottomNavigationBar: const BottomNavBar(curIndex: 1),
    );
  }
}

// Create the get campus widget here
Widget getCampus(int campusIndex, BuildContext context) {
  switch (campusIndex) {
    // Main Campus
    case 0:
      return Column(
        children: <Widget>[
          // The About Us section
          Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: const Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "About Us\n",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0
                    ),
                  ),
                  TextSpan(
                    // Change the about us info here
                    text: "Lorem Ipsum where this is the part we place in the "
                    "about main campus info here.",
                    style: TextStyle(
                      color: Colors.black54
                    )
                  )
                ]
              )
            )
          ),

          // The picture of main campus section
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Image(
              // Change the picture by changing the path here
              image: AssetImage("assets/images/dtsp_main_campus.jpg"),
              fit: BoxFit.fill,
            )
          ),

          const SizedBox(height: 10,),

          // Contact Us section
          Container(
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 3),
            child: Column(
              children: const <Widget>[
                Text(
                  "Contact Us",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ListTile(
                  leading: Icon(Icons.punch_clock_rounded),
                  title: Text("Working Hour: 0800 - 1700 GMT+8")
                ),
                ListTile(
                  leading: Icon(Icons.location_on_outlined),
                  title: Text("Location: Chancellory Building USM"),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("Contact number: 045536678"),
                )
              ],
            ),
          )
        ],
      );

    // Engineering Campus
    case 1:
      return Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: const Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "About Us\n",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  TextSpan(
                    // Change the about us info here
                    text: "Lorem Ipsum where this is the part we place in the "
                    "about health campus info here.",
                    style: TextStyle(
                      color: Colors.black54
                    )
                  )
                ]
              )
            )
          ),

          // The picture of main campus section
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Image(
              // Change the picture by changing the path here
              image: AssetImage("assets/images/medical_campus.jpg"),
              fit: BoxFit.fill,
            )
          ),

          const SizedBox(height: 10,),

          // Contact Us section
          Container(
            margin: EdgeInsets.only(right:MediaQuery.of(context).size.width / 3),
            child: Column(
              children: const <Widget>[
                Text(
                  "Contact Us",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ListTile(
                  leading: Icon(Icons.punch_clock_rounded),
                  title: Text("Working Hour: 0800 - 1700 GMT+8")
                ),
                ListTile(
                  leading: Icon(Icons.location_on_outlined),
                  title: Text("Location: Chancellory Building USM"),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("Contact number: 045536678"),
                )
              ],
            ),
          )
        ],
      );

    // Health Campus
    case 2:
      return Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: const Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "About Us\n",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  TextSpan(
                    // Change the about us info here
                    text: "Lorem Ipsum where this is the part we place in the "
                    "about engineering campus info here.",
                    style: TextStyle(
                      color: Colors.black54
                    )
                  )
                ]
              )
            )
          ),

          // The picture of main campus section
          Container(
            padding: const EdgeInsets.all(20.0),
            child: const Image(
              // Change the picture by changing the path here
              image: AssetImage("assets/images/engineering_campus.jpg"),
              fit: BoxFit.fill,
            )
          ),

          const SizedBox(height: 10,),

          // Contact Us section
          Container(
            margin: EdgeInsets.only(right: MediaQuery.of(context).size.width / 3),
            child: Column(
              children: const <Widget>[
                Text(
                  "Contact Us",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ListTile(
                  leading: Icon(Icons.punch_clock_rounded),
                  title: Text("Working Hour: 0800 - 1700 GMT+8")
                ),
                ListTile(
                  leading: Icon(Icons.location_on_outlined),
                  title: Text("Location: Chancellory Building USM"),
                ),
                ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("Contact number: 045536678"),
                )
              ],
            ),
          )
        ],
      );

    default:
      return Container(
        alignment: Alignment.center,
        child: const Text(
          "Oops, nothing to see here.",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      );
  }
}
