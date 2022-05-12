import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Posts with ChangeNotifier {
  late QuerySnapshot postColl;
  final _instance = FirebaseFirestore.instance;
  final _storageInstance = FirebaseStorage.instance;

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
    XFile? media,
  }) async {
    String downloadUrl = '';

    if (media != null) {
      final imagePath = _storageInstance
          .ref()
          .child('${media.hashCode.toString()}-${media.name}');
      await imagePath.putFile(File(media.path));
      downloadUrl = await imagePath.getDownloadURL();
    }

    await _instance.collection('posts').add({
      'author': author,
      'content': content,
      'media': downloadUrl,
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
