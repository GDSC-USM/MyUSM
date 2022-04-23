import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_usm/screens/profile_edit_screen.dart';
import 'package:my_usm/widgets/app_bar.dart';
import 'package:my_usm/widgets/bottom_nav_bar.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Profile extends StatelessWidget {
  static const String routeName = "/profile";
  const Profile({Key? key}) : super(key: key);

  // Used for the about me description testing purpose
  final String aboutMe =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consequat interdum venenatis. Pellentesque sed nunc ut nunc lacinia mollis. Nullam euismod est sed porta faucibus. Curabitur interdum dolor leo, et lobortis diam pretium quis. Praesent ligula mauris, convallis eu ultricies ac, euismod sed lectus. Ut elit velit, scelerisque at lorem at, euismod dapibus sapien. Praesent vel lorem vitae lectus iaculis pharetra. Nullam interdum, tellus ac ullamcorper auctor, ante ante efficitur nibh, ut dictum justo ligula imperdiet felis. Proin accumsan odio sed arcu accumsan, a lobortis leo pellentesque. Nullam at porttitor velit";

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
                  child: Container(
                    height: 150,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://www.sageisland.com/wp-content/uploads/2017/06/beat-instagram-algorithm.jpg'),
                            fit: BoxFit.cover)),
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
                                child: Container(
                                  height: 90,
                                  width: 90,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              'http://cdn.ppcorn.com/us/wp-content/uploads/sites/14/2016/01/Mark-Zuckerberg-pop-art-ppcorn.jpg'))),
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
                              const Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Text(
                                  "Jason Lee\nSchool of Computer Science\nYear 1",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 243, 239, 245),
                                      height: 1.8),
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
                              // TODO: Navigate to Edit page once it is done
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
            child: Text(
              aboutMe,
              style: const TextStyle(
                color: Color.fromARGB(255, 39, 38, 53),
                fontSize: 15,
              ),
              textAlign: TextAlign.justify,
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
          // TODO: Solve contraints error
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
