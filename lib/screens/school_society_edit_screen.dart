import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_usm/widgets/app_bar.dart';
import 'package:my_usm/widgets/bottom_nav_bar.dart';

class SchoolSocietyEdit extends StatefulWidget {
  static const String routeName = "/schoolSocietyEdit";
  const SchoolSocietyEdit({Key? key}) : super(key: key);

  @override
  State<SchoolSocietyEdit> createState() => _SchoolSocietyEdit();
}

class _SchoolSocietyEdit extends State<SchoolSocietyEdit> {
  // Defaults to one, because there will definitely be one member
  int organizationHeight = 1;

  // This list should be fetched from Firebase
  List<Widget> organizationList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperNavBar(title: "Edit").build(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Stack cover image with edit icon
            Stack(
              fit: StackFit.loose,
              clipBehavior: Clip.none,
              alignment: Alignment.bottomRight,
              children: <Widget>[
                // Cover image
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 150,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/chapter_banners/Copy_of_Copy_of_Google_Developer_Student_Clubs_Chapter__Facebook_Banners.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ],
                ),

                // Edit icon
                // Edit button
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 243, 239, 245),
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(5),
                    ),

                    /* 
                        TODO: Edit the onPressed button so that it allows the
                        user to change their cover image
                      */
                    onPressed: () {
                      null;
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.pencil,
                      color: Color.fromARGB(255, 255, 127, 17),
                      size: 5,
                    ))
              ],
            ),

            Stack(
              alignment: Alignment.bottomRight,
              clipBehavior: Clip.none,
              fit: StackFit.loose,
              children: <Widget>[
                Container(
                  height: 90,
                  width: 90,
                  margin: const EdgeInsets.only(left: 5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://yt3.ggpht.com/ljpMPa4UuzF-SAFmfosyHiaaalAzOBcJSnyh2LZX4ZFQsE_8WltzJMn8oREssik5yauaQzrubw=s900-c-k-c0x00ffffff-no-rj'))),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 243, 239, 245),
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(5),
                        minimumSize: const Size(20, 20)),

                    /* 
                            TODO: Edit the onPressed button so that it allows the
                            user to change their profile image
                          */
                    onPressed: () {
                      null;
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.pencil,
                      color: Color.fromARGB(255, 255, 127, 17),
                      size: 15,
                    ))
              ],
            ),

            // Name edit section
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  // Label Text
                  label: const Text("Name"),
                  labelStyle:
                      const TextStyle(color: Color.fromARGB(255, 39, 38, 53)),
                  floatingLabelStyle:
                      const TextStyle(color: Color.fromARGB(255, 255, 127, 17)),

                  // This can be changed to user's current name
                  hintText: "The Epic name",

                  // Borders
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 39, 38, 53), width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 255, 127, 17), width: 2),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),

            // Punchline edit section
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  // Label Text
                  label: const Text("Punchline"),
                  labelStyle:
                      const TextStyle(color: Color.fromARGB(255, 39, 38, 53)),
                  floatingLabelStyle:
                      const TextStyle(color: Color.fromARGB(255, 255, 127, 17)),

                  // This can be changed to user's current name
                  hintText: "Hit them with a great one!",

                  // Borders
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 39, 38, 53), width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 255, 127, 17), width: 2),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),

            // About us edit section
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 5 * 24,
                child: TextField(
                  //textAlignVertical: TextAlignVertical.top,
                  maxLines: 5,
                  decoration: InputDecoration(
                    // Label Text
                    labelText: "About Me",
                    labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 39, 38, 53),
                        leadingDistribution:
                            TextLeadingDistribution.proportional),
                    floatingLabelStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 127, 17)),

                    // This can be changed to user's current school
                    hintText: "Why am I so Epic",

                    contentPadding: const EdgeInsets.all(10.0),
                    alignLabelWithHint: true,

                    // Borders
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 39, 38, 53), width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 127, 17), width: 2),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),

            // Edit organization title
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Edit Organization",
                style: TextStyle(
                  color: Color.fromARGB(255, 39, 38, 53),
                  fontSize: 18,
                ),
              ),
            ),

            // Edit organization section
            Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 39, 38, 53),
                ),
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: organizationList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return organizationList[index];
                  }
              ),
            ),

            // Add position button
            Center(
              child: ElevatedButton(
                  onPressed: addOrganizationList,
                  child: const Icon(
                    Icons.add,
                    color: Color.fromARGB(255, 255, 127, 17),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 39, 38, 53),
                    
                  ),
              ),
            ),

            // Social Links title
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Social Links",
                style: TextStyle(
                  color: Color.fromARGB(255, 39, 38, 53),
                  fontSize: 18,
                ),
              ),
            ),

            // LinkedIn edit section
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                leading: const FaIcon(
                  FontAwesomeIcons.linkedin,
                  color: Color.fromARGB(255, 39, 38, 53),
                  size: 40,
                ),
                visualDensity: VisualDensity.compact,
                title: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    // Borders
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 39, 38, 53), width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 127, 17), width: 2),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),

            // Instagram edit section
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                leading: const FaIcon(
                  FontAwesomeIcons.instagram,
                  color: Color.fromARGB(255, 39, 38, 53),
                  size: 40,
                ),
                visualDensity: VisualDensity.compact,
                title: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    // Borders
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 39, 38, 53), width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 127, 17), width: 2),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),

            // Facebook edit section
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                leading: const FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Color.fromARGB(255, 39, 38, 53),
                  size: 40,
                ),
                visualDensity: VisualDensity.compact,
                title: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    // Borders
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 39, 38, 53), width: 2),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 255, 127, 17), width: 2),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ),

            /*
              The save button, when the user presses save, it should save all the
              edited properties.
            */
            Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  null;
                },
                child: const Text("Save"),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 39, 38, 53),
                  textStyle: const TextStyle(
                      color: Color.fromARGB(255, 243, 239, 245)),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(curIndex: 1),
    );
  }

  Widget createPosition() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: const TextField(
              decoration: InputDecoration(hintText: "What is this position?"),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: const TextField(
              decoration:
                  InputDecoration(hintText: "Who's holding this position?"),
            ),
          )
        ],
      );
  }

  void addOrganizationList() {
    setState(() {
      organizationList.add(createPosition());
    });
  }
}
