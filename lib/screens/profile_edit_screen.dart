import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_usm/widgets/app_bar.dart';
import 'package:my_usm/widgets/bottom_nav_bar.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = "/profileEdit";
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  String dropdownValue = "1";
  int maxLines = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperNavBar(title: "Edit").build(context),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomLeft,
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            children: <Widget>[
              // Cover Image with edit button
              Stack(
                alignment: Alignment.bottomRight,
                fit: StackFit.loose,
                clipBehavior: Clip.none,
                children: <Widget>[
                  // Cover Image
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

                  // Edit button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 243, 239, 245),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(5)),

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
                      )),
                ],
              ),

              // Profile Image with edit button
              Positioned(
                top: MediaQuery.of(context).size.height * 0.12,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    //Profile Image
                    Container(
                      height: 90,
                      width: 90,
                      margin: const EdgeInsets.only(left: 5),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'http://cdn.ppcorn.com/us/wp-content/uploads/sites/14/2016/01/Mark-Zuckerberg-pop-art-ppcorn.jpg'))),
                    ),

                    // Edit button
                    Positioned(
                        top: 50,
                        left: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary:
                                    const Color.fromARGB(255, 243, 239, 245),
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(5)),

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
                            ))),
                  ],
                ),
              )
            ],
          ),

          // Space between the text fields and cover image
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
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

          // School of study edit section
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                // Label Text
                label: const Text("School of Study"),
                labelStyle:
                    const TextStyle(color: Color.fromARGB(255, 39, 38, 53)),
                floatingLabelStyle:
                    const TextStyle(color: Color.fromARGB(255, 255, 127, 17)),

                // This can be changed to user's current school
                hintText: "The Epic school",

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

          // Year of study edit section
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  return InputDecorator(
                    decoration: InputDecoration(
                      label: const Text("Year of Study"),
                      floatingLabelStyle: const TextStyle(
                          color: Color.fromARGB(255, 39, 38, 53)),

                      hintText: dropdownValue,

                      // Borders
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 39, 38, 53), width: 2),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    isEmpty: dropdownValue == '',
                    child: DropdownButton(
                        /*
                          Value of the current year, may need to be fetched from 
                          database
                        */
                        value: dropdownValue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        isDense: true,
                        isExpanded: true,
                        items: <String>["1", "2", "3", "4"]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        }),
                  );
                },
              )),

          // About me edit section
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              height: maxLines * 24,
              child: TextField(
                //textAlignVertical: TextAlignVertical.top,
                maxLines: maxLines,
                decoration: InputDecoration(
                  // Label Text
                  labelText: "About Me",
                  labelStyle: const TextStyle(
                      color: Color.fromARGB(255, 39, 38, 53),
                      leadingDistribution:
                          TextLeadingDistribution.proportional),
                  floatingLabelStyle:
                      const TextStyle(color: Color.fromARGB(255, 255, 127, 17)),

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

          const Padding(
            padding: EdgeInsets.all(10.0),
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
            padding: const EdgeInsets.all(10.0),
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
            padding: const EdgeInsets.all(10.0),
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
            padding: const EdgeInsets.all(10.0),
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
                    color: Color.fromARGB(255, 243, 239, 245)
                  ),
                ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(curIndex: 3),
    );
  }
}
