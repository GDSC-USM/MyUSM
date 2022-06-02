import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'package:my_usm/widgets/app_bar.dart';
import 'package:my_usm/widgets/bottom_nav_bar.dart';
import '../providers/user.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = "/profileEdit";
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfile();
}

class _EditProfile extends State<EditProfile> {
  String dropdownValue = "1";
  int maxLines = 5;
  XFile? _pickedProfile;
  XFile? _pickedBanner;

  final nameController = TextEditingController();
  final schoolController = TextEditingController();
  final aboutController = TextEditingController();
  final linkedinController = TextEditingController();
  final instagramController = TextEditingController();
  final facebookController = TextEditingController();

  // Note: The only reason I made this function twice was because
  // I don't know if pass by reference exists in dart.
  Future<void> pickProfile() async {
    final _imagePicker = ImagePicker();
    _pickedProfile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 300,
      maxHeight: 300,
    );
    setState(() {});
  }

  Future<void> pickBanner() async {
    final _imagePicker = ImagePicker();
    _pickedBanner = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 300,
      maxHeight: 300,
    );
    setState(() {});
  }

  void validate() async {
    await Provider.of<User>(context, listen: false).updateUser(
      name: nameController.text.isEmpty
          ? Provider.of<User>(context, listen: false).defaultAccount['Name']
          : nameController.text,
      school: schoolController.text.isEmpty
          ? Provider.of<User>(context, listen: false).defaultAccount['School']
          : schoolController.text,
      year: dropdownValue,
      banner: _pickedBanner,
      profile: _pickedProfile,
      about: aboutController.text,
      facebook: facebookController.text,
      instagram: instagramController.text,
      linkedin: linkedinController.text,
    );
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Updated Successfully!')));
  }

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
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: _pickedBanner == null
                                    ? NetworkImage(Provider.of<User>(context,
                                            listen: false)
                                        .defaultAccount['Banner-pic'])
                                    : FileImage(File(_pickedBanner!.path))
                                        as ImageProvider<Object>)),
                      ),
                    ),
                  ]),

                  // Edit button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 243, 239, 245),
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(5)),
                      onPressed: () {
                        pickBanner();
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
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: _pickedProfile == null
                                  ? NetworkImage(
                                      Provider.of<User>(context, listen: false)
                                          .defaultAccount['Profile-pic'])
                                  : FileImage(File(_pickedProfile!.path))
                                      as ImageProvider<Object>)),
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
                            onPressed: () {
                              pickProfile();
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
              controller: nameController,
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
              controller: schoolController,
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
                controller: aboutController,
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
                controller: linkedinController,
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
                controller: instagramController,
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
                controller: facebookController,
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
                validate();
              },
              child: const Text("Save"),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 39, 38, 53),
                textStyle:
                    const TextStyle(color: Color.fromARGB(255, 243, 239, 245)),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(curIndex: 3),
    );
  }
}
