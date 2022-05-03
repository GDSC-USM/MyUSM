import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Posts with ChangeNotifier {
  late QuerySnapshot postColl;
  final _instance = FirebaseFirestore.instance;

  Future<void> getPosts() async {
    // TODO Grab all the data that is in the posts collection
    postColl = await _instance.collection('posts').get();

    for (var document in postColl.docs) {
      // TODO Do something with the posts
    }
  }

  Future<void> createPost({
    required String author,
    required String content,
  }) async {
    await _instance.collection('posts').add({
      'author': author,
      'content': content,
      'timestamp': Timestamp.now(),
    });
  }

  Posts() {
    // TODO implement constructor
    // The constructor runs the getPosts function
    // Allowing the posts data to be collected from start
    getPosts();
  }
}
