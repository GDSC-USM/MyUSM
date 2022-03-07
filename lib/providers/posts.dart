import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Posts with ChangeNotifier {
  late QuerySnapshot postColl;

  Future<void> getPosts() async {
    // Grab all the data that is in the posts collection
    postColl = await FirebaseFirestore.instance.collection('posts').get();

    postColl.docs.forEach((element) {
      // Do something with them
    });
  }

  Posts() {
    // The constructor runs the getPosts function
    // Allowing the posts data to be collected from start
    getPosts();
  }
}
