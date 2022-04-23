import 'package:flutter/material.dart';
import 'package:my_usm/widgets/app_bar.dart';
import 'package:my_usm/widgets/bottom_nav_bar.dart';

class NotificationScreen extends StatefulWidget {
  static const String routeName = "/notificationScreens";
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Information should be fetched from Firebase
  var notificationList = {
    "Lecture update": "Lecture is cancelled",
    "CST 235 Chapter 2": "Notes for chapter 2 is uploaded to E-Learn",
    "GDSC New Event": "GDSC USM is organizing a new event",
    "USM Server Down":
        "Yes, another day where the server is not working. We Lead"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperNavBar(title: "Notification").build(context),
      body: ListView.builder(
          itemCount: notificationList.length,
          itemBuilder: (BuildContext context, int index) {
            final item = notificationList.keys.elementAt(index);
            return Dismissible(
              key: Key(item),
              onDismissed: (direction) {
                setState(() {
                  notificationList.remove(item);
                });
              },
              background: Container(color: Colors.red),
              child: ExpansionTile(
                title: Text(notificationList.keys.elementAt(index)),
                iconColor: const Color.fromARGB(255, 255, 127, 17),
                textColor: const Color.fromARGB(255, 255, 127, 17),
                children: <Widget>[
                  ListTile(
                    title: Text(notificationList.values.elementAt(index)),
                  )
                ],
                controlAffinity: ListTileControlAffinity.leading,
              ),
            );
          }),
      bottomNavigationBar: const BottomNavBar(curIndex: 2),
    );
  }
}
