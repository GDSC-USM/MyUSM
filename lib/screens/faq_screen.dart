import 'package:flutter/material.dart';
import 'package:my_usm/widgets/app_bar.dart';
import 'package:my_usm/widgets/bottom_nav_bar.dart';

class FAQ extends StatefulWidget {
  static const String routeName = "/faq";
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  // Used for the context of testing the widget
  var faqs = {
    "Why USM?": "Because it's cool",
    "Why is this so random": "Because this is random",
    "Why is the server crashing": "Because it's APEX"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperNavBar(title: "FAQ").build(context),
      // Build the list of FAQs based on the Firebase data
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: faqs.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionTile(
            title: Text(faqs.keys.elementAt(index)),
            children: <Widget>[
              ListTile(
                title: Text(faqs.values.elementAt(index)),
              )
            ],
            controlAffinity: ListTileControlAffinity.leading,
          );
      }),
      bottomNavigationBar: const BottomNavBar(curIndex: 0),
    );
  }
}
