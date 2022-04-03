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
    "Why is the server crashing": "Because it's APEX",
    "Test for a long one" : "Holyd snd sudfgsugdfsgf hdsafdhfydgf hdsgfdhjfh udfhudgdfbdfhdu fgduy fg  ds duf uudsyuuds ud udh fud fdu du "
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperNavBar(title: "FAQ").build(context),

      // Build the list of FAQs based on the Firebase data
      body: Column(
        children: <Widget>[
          // Space between app bar and search box
          const SizedBox(
            height: 10,
          ),

          // The search box
          Container(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              tileColor: const Color.fromARGB(255, 39, 38, 53),
              iconColor: const Color.fromARGB(255, 243, 239, 245),
              leading: const Icon(Icons.search),
              title: const TextField(
                decoration: InputDecoration(
                  hintText: "Curious..? Search for the answer here.",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 243, 239, 245),
                  ),
                ),
                style: TextStyle(color: Color.fromARGB(255, 243, 239, 245)),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),

          // Space between search box and the FAQs
          const SizedBox(
            height: 10,
          ),

          // FAQ list tiles
          ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(10.0),
            itemCount: faqs.length,
            itemBuilder: (BuildContext context, int index) {
              return ExpansionTile(
                iconColor: const Color.fromARGB(255, 255, 127, 17),
                textColor: const Color.fromARGB(255, 255, 127, 17),
                
                title: Text(faqs.keys.elementAt(index)),

                /*
                  Truncated the text so that it shows a sneak peek of the 
                  answer if it's long.
                */
                subtitle: Text(
                  faqs.values.elementAt(index),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                children: <Widget>[
                  ListTile(
                    title: Text(
                      faqs.values.elementAt(index),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 39, 38, 53)
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                  )
                ],
                controlAffinity: ListTileControlAffinity.leading,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10,
              );
            },
          ),
        ],
      ),

      bottomNavigationBar: const BottomNavBar(curIndex: 0),
    );
  }
}
