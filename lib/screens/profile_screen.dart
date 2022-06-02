import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:provider/provider.dart';

import 'package:my_usm/screens/profile_edit_screen.dart';
import 'package:my_usm/widgets/app_bar.dart';
import 'package:my_usm/widgets/bottom_nav_bar.dart';
import '../providers/user.dart';

class Profile extends StatelessWidget {
  static const String routeName = "/profile";
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperNavBar(title: "Profile").build(context),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            fit: StackFit.passthrough,
            clipBehavior: Clip.none,
            children: <Widget>[
              // Cover image
              /*
                The Row class is needed for the Expansion to work, do not remove
                it unless you know what you're doing it

                Side note: It can be replaced with Column or Flex class
              */
              Row(children: <Widget>[
                Expanded(
                  child: Consumer<User>(
                    builder: (ctx, user, _) => Container(
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  user.defaultAccount['Banner-pic']),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
              ]),

              // Profile widget
              Positioned(
                  top: 100.0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(alignment: Alignment.topRight, children: <
                          Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          color: const Color.fromARGB(255, 39, 38, 53),
                          height: 120,
                          width: MediaQuery.of(context).size.width * 0.95,

                          // Places the information in a row
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              // Profile Image
                              Flexible(
                                flex: 1,
                                child: Consumer<User>(
                                  builder: (ctx, user, _) => Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            user.defaultAccount['Profile-pic']),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              /*
                                  Basic Info container, arranged in a column
                                  The format of the info goes like this:

                                  1. Name
                                  2. School
                                  3. Year of study

                                  These informations should be fetched from
                                  Firebase later
                                */
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Positioned(
                                  child: Consumer<User>(
                                    builder: (ctx, user, _) {
                                      return Text(
                                        "${user.defaultAccount['Name']}\n${user.defaultAccount['School']}\n${user.defaultAccount['Study-year']}",
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 243, 239, 245),
                                            height: 1.8),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Edit button
                        Positioned(
                            right: MediaQuery.of(context).size.width * 0.05,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromARGB(255, 243, 239, 245),
                                  minimumSize: const Size(25, 15),
                                  shape: const StadiumBorder()),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(EditProfile.routeName);
                              },
                              child: const Text(
                                "Edit",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 39, 38, 53),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),

                        // Social icons
                        Positioned(
                          top: 85,
                          right: MediaQuery.of(context).size.width * 0.05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              // LinkedIn Icon
                              IconButton(
                                  constraints: const BoxConstraints(),
                                  padding: const EdgeInsets.all(3),

                                  // Link to the profile of the user
                                  onPressed: () {
                                    return;
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.linkedin,
                                    color: Color.fromARGB(255, 243, 239, 245),
                                  )),

                              // Instagram Icon
                              IconButton(
                                  constraints: const BoxConstraints(),
                                  padding: const EdgeInsets.all(3),

                                  // Link to the profile of the user
                                  onPressed: () {
                                    return;
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.instagram,
                                    color: Color.fromARGB(255, 243, 239, 245),
                                  )),

                              // Facebook Icon
                              IconButton(
                                constraints: const BoxConstraints(),
                                padding: const EdgeInsets.all(3),

                                // Link to the profile of the user
                                onPressed: () {
                                  return;
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: Color.fromARGB(255, 243, 239, 245),
                                ),
                              )
                            ],
                          ),
                        )
                      ])))
            ],
          ),

          // About me Title
          Container(
            margin: const EdgeInsets.only(top: 80),
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: const Text(
              "About Me",
              style: TextStyle(
                  color: Color.fromARGB(255, 39, 38, 53),
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),

          // About me description
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: Consumer<User>(
              builder: (ctx, user, _) => Text(
                user.defaultAccount['About-me'],
                style: const TextStyle(
                  color: Color.fromARGB(255, 39, 38, 53),
                  fontSize: 15,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),

          // Timetable Title
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
            child: const Text(
              "My Timetable",
              style: TextStyle(
                  color: Color.fromARGB(255, 39, 38, 53),
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),

          // Timetable content
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            height: 300,
            child: SfPdfViewer.asset("assets/PPSK_JW_Sem2_2021-2022.pdf"),
          ),

          // Sized Box to enable a little bit of over scrolling
          const SizedBox(
            height: 50,
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(curIndex: 3),
    );
  }
}
