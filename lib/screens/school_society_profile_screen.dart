import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_usm/providers/posts.dart';
import 'package:my_usm/screens/school_society_edit_screen.dart';
import 'package:my_usm/widgets/app_bar.dart';
import 'package:my_usm/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

class SchoolSocietyProfile extends StatefulWidget {
  static const String routeName = "/schoolSocietyProfile";
  final String _title;
  const SchoolSocietyProfile({Key? key, required title})
      : _title = title,
        super(key: key);

  @override
  State<SchoolSocietyProfile> createState() => _SchoolSocietyProfileState();
}

class _SchoolSocietyProfileState extends State<SchoolSocietyProfile> {
  bool isSubscribed = false, isHome = true;
  // Holds the image/video
  XFile? _pickedImage;
  // Function to pick the image/video
  Future<void> pickImage() async {
    final _imagePicker = ImagePicker();
    _pickedImage = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 500,
      maxHeight: 500,
    );
    setState(() {});
  }

  void clearImage() {
    _pickedImage = null;
    setState(() {});
  }

  // For the sake of testing the widgets
  String aboutUs =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque consequat interdum venenatis. Pellentesque sed nunc ut nunc lacinia mollis. Nullam euismod est sed porta faucibus. Curabitur interdum dolor leo, et lobortis diam pretium quis. Praesent ligula mauris, convallis eu ultricies ac, euismod sed lectus. Ut elit velit, scelerisque at lorem at, euismod dapibus sapien. Praesent vel lorem vitae lectus iaculis pharetra. Nullam interdum, tellus ac ullamcorper auctor, ante ante efficitur nibh, ut dictum justo ligula imperdiet felis. Proin accumsan odio sed arcu accumsan, a lobortis leo pellentesque. Nullam at porttitor velit";
  var organization = {
    "President": "Jeremy Lau",
    "Vice President": "Jackson Liew",
    "Treasurer": "Forgot Who",
    "Secretary": "Yeong Yen Ting",
    "Some Position": "Dunno Lim"
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpperNavBar(title: widget._title).build(context),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          // Cover image
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/chapter_banners/Copy_of_Copy_of_Google_Developer_Student_Clubs_Chapter__Facebook_Banners.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),

          // Society logo, name and subscribe button
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            scale: 100,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://yt3.ggpht.com/ljpMPa4UuzF-SAFmfosyHiaaalAzOBcJSnyh2LZX4ZFQsE_8WltzJMn8oREssik5yauaQzrubw=s900-c-k-c0x00ffffff-no-rj"))),
                  ),
                ),
                Flexible(flex: 4, child: Text(widget._title)),
                Flexible(
                  flex: 2,
                  child: ElevatedButton(
                      child: Text(
                        isSubscribed ? "Subscribed" : "Subscribe",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 39, 38, 53)),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(10, 25),
                          primary: const Color.fromARGB(255, 243, 239, 245),
                          onSurface: const Color.fromARGB(255, 243, 239, 245),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 39, 38, 53))),
                      /*
                        Allows the user to subscribe if not subscibed,
                        the user can also unsubscribe if subscribed.
                      */
                      onPressed: () {
                        setState(() {
                          isSubscribed = isSubscribed ? false : true;
                        });
                      }),
                )
              ],
            ),
          ),

          /*
            Punch line
            ** Replace it after database is setup **
          */
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Google is always inspiring",
                  style: TextStyle(color: Colors.grey.shade600),
                )),
          ),

          // Home and Posts button section
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Color.fromARGB(255, 39, 38, 53)),
                      bottom:
                          BorderSide(color: Color.fromARGB(255, 39, 38, 53)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // Home Button
                  TextButton(
                    child: const Text("Home"),
                    onPressed: () {
                      setState(() {
                        isHome = true;
                      });
                    },
                    style: TextButton.styleFrom(
                        primary: isHome
                            ? const Color.fromARGB(255, 255, 127, 17)
                            : const Color.fromARGB(255, 39, 38, 53)),
                  ),

                  // Post button
                  TextButton(
                    child: const Text("Posts"),
                    onPressed: () {
                      setState(() {
                        isHome = false;
                      });
                    },
                    style: TextButton.styleFrom(
                        primary: isHome
                            ? const Color.fromARGB(255, 39, 38, 53)
                            : const Color.fromARGB(255, 255, 127, 17)),
                  ),
                ],
              ),
            ),
          ),

          // Change between home screen and posts screen
          SliverToBoxAdapter(
            child: isHome ? homeScreen() : postScreen(),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(curIndex: 1),
    );
  }

  Widget homeScreen() {
    return Column(
      children: <Widget>[
        // Edit button only visible for page admins
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 10.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SchoolSocietyEdit.routeName);
            },
            child: const Text("Edit"),
            style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 39, 38, 53),
                textStyle: const TextStyle(
                    color: Color.fromARGB(255, 243, 239, 245),
                    fontWeight: FontWeight.bold)),
          ),
        ),

        // About us title
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "About Us",
            style: TextStyle(
                color: Color.fromARGB(255, 39, 38, 53),
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),

        // About us content
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ExpandableText(
            aboutUs,
            expandText: "show more",
            collapseText: "show less",
            maxLines: 3,
            linkColor: const Color.fromARGB(255, 255, 127, 17),
            animation: true,
            textAlign: TextAlign.justify,
          ),
        ),

        // Organization title
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Organization",
            style: TextStyle(
                color: Color.fromARGB(255, 39, 38, 53),
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),

        // Organization section
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
              height: 200.0,
              child: PageView.builder(
                  controller: PageController(viewportFraction: 0.55),
                  itemCount: organization.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        color: const Color.fromARGB(230, 39, 38, 53),
                        margin: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 24),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                margin: const EdgeInsets.all(10.0),
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
                            Text(
                              organization.keys.elementAt(index),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 243, 239, 245),
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              organization.values.elementAt(index),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 243, 239, 245),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
        ),

        // Social Links title
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Social Links",
            style: TextStyle(
                color: Color.fromARGB(255, 39, 38, 53),
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
        ),

        // Social links icon buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            IconButton(
                onPressed: null,
                icon: FaIcon(FontAwesomeIcons.linkedin,
                    color: Color.fromARGB(255, 39, 38, 53))),
            IconButton(
                onPressed: null,
                icon: FaIcon(FontAwesomeIcons.instagram,
                    color: Color.fromARGB(255, 39, 38, 53))),
            IconButton(
                onPressed: null,
                icon: FaIcon(FontAwesomeIcons.facebook,
                    color: Color.fromARGB(255, 39, 38, 53)))
          ],
        ),
      ],
    );
  }

  Widget postScreen() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      // Button for a new post (only seen by the profile admins)
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            // Holds content of post text
            final contentController = TextEditingController();

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return StatefulBuilder(
                      builder: (context, setState) => AlertDialog(
                            title: const Text("New Post"),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text("Caption"),

                                // Add caption box
                                SizedBox(
                                  height: 124,
                                  child: TextField(
                                    controller: contentController,
                                    maxLines: 10,
                                    decoration: InputDecoration(
                                        hintText: "What's on your mind?",

                                        // Styling
                                        filled: true,
                                        fillColor: Colors.grey.shade200,
                                        border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 39, 38, 53),
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 255, 127, 17),
                                                width: 2),
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ),

                                // Add photo icon
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          await pickImage();
                                          setState(() {});
                                        },
                                        icon: const Icon(
                                          Icons.photo_camera_back_outlined,
                                          color:
                                              Color.fromARGB(255, 39, 38, 53),
                                        )),
                                    // add conditionally
                                    if (_pickedImage != null)
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              _pickedImage!.name,
                                              overflow: TextOverflow.fade,
                                              softWrap: false,
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                clearImage();
                                                setState(() {});
                                              },
                                              icon: const Icon(
                                                  Icons.delete_outlined)),
                                        ],
                                      )
                                    // IconButton(
                                    //     onPressed: () {},
                                    //     icon: const Icon(
                                    //       Icons.video_camera_back_outlined,
                                    //       color: Color.fromARGB(255, 39, 38, 53),
                                    //     )),
                                  ],
                                ),

                                // Post it button
                                ElevatedButton(
                                  onPressed: () {
                                    if (contentController.text.isEmpty) {
                                      return;
                                    }
                                    Provider.of<Posts>(context, listen: false)
                                        .createPost(
                                            author: widget._title,
                                            content: contentController.text,
                                            media: _pickedImage)
                                        .then((value) {
                                      Navigator.of(context).pop();
                                      clearImage();
                                    });
                                  },
                                  child: const Text("Post it!"),
                                  style: ElevatedButton.styleFrom(
                                      primary:
                                          const Color.fromARGB(255, 39, 38, 53),
                                      textStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 243, 239, 245),
                                      )),
                                )
                              ],
                            ),
                            scrollable: true,
                          ));
                });
          },
          child: const Text(
            "New Post",
            style: TextStyle(color: Color.fromARGB(255, 243, 239, 245)),
          ),
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 39, 38, 53),
          ),
        ),
      ),

      // The posts of the profile
      ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(10.0),
            height: 200,
            alignment: Alignment.center,
            child: Text(
              "Post number " + (index + 1).toString(),
              style: const TextStyle(color: Colors.white),
            ),
            color: const Color.fromARGB(255, 39, 38, 53),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 10.0,
        ),
        itemCount: 10,
      ),
    ]);
  }
}
