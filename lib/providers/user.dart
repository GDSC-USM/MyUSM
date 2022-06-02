import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class User with ChangeNotifier {
  // The class is a singleton
  static final User _singleton = User._initialize();
  static final _firestoreInstance = FirebaseFirestore.instance;
  static final _storageInstance = FirebaseStorage.instance;

  late Map<String, dynamic> defaultAccount = {
    'Name': 'New User ${_instance.currentUser!.uid.substring(0, 5)}',
    'School': 'School of Computer Science',
    'Study-year': 'Year 1',
    'Profile-pic':
        'http://cdn.ppcorn.com/us/wp-content/uploads/sites/14/2016/01/Mark-Zuckerberg-pop-art-ppcorn.jpg',
    'Banner-pic':
        'https://www.sageisland.com/wp-content/uploads/2017/06/beat-instagram-algorithm.jpg',
    'About-me': 'Hey, I\'m a new user!',
    'Linkedin': null,
    'Instagram': null,
    'Facebook': null,
  };

  factory User() {
    return _singleton;
  }

  User._initialize();

  // Instance of the current user
  final _instance = FirebaseAuth.instance;

  bool get isLoggedIn {
    // If the user isn't logged in, this value will be null
    return _instance.currentUser != null;
  }

  void logout() {
    _instance.signOut();
    notifyListeners();
  }

  Future<void> signup(String email, String password, BuildContext ctx) async {
    try {
      // Creates the new user
      await _instance.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (err) {
      String message = 'An error occured';
      // Check if error is from firebaseAuth. If so, set the error message accordingly.
      if (err.runtimeType == FirebaseAuthException) {
        FirebaseAuthException error = err as FirebaseAuthException;
        message = error.message!;
      }
      _showErrorMessage(message, ctx);
    } finally {
      await _firestoreInstance
          .collection('users')
          .doc(_instance.currentUser!.uid)
          .set(defaultAccount);
      notifyListeners();
    }
  }

  Future<void> login(String email, String password, BuildContext ctx) async {
    try {
      // Logs the user in
      await _instance.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (err) {
      String message = 'An error occured';
      // Check if error is from firebaseAuth. If so, set the error message accordingly.
      if (err.runtimeType == FirebaseAuthException) {
        FirebaseAuthException error = err as FirebaseAuthException;
        message = error.message!;
      }
      _showErrorMessage(message, ctx);
    } finally {
      DocumentSnapshot result = await _firestoreInstance
          .collection('users')
          .doc(_instance.currentUser!.uid)
          .get();
      defaultAccount = result.data() as Map<String, dynamic>;
      notifyListeners();
    }
  }

  // Since it's used more than once, made it into a function
  void _showErrorMessage(String message, BuildContext ctx) {
    // Show the error message
    ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(ctx).errorColor,
      ),
    );
  }

  Future<void> updateUser({
    required String name,
    required String school,
    required String year,
    XFile? profile,
    XFile? banner,
    String? about,
    String? linkedin,
    String? instagram,
    String? facebook,
  }) async {
    String profileDownloadUrl = '';
    String bannerDownloadUrl = '';

    if (profile != null) {
      final imagePath = _storageInstance
          .ref()
          .child('${profile.hashCode.toString()}-${profile.name}');
      await imagePath.putFile(File(profile.path));
      profileDownloadUrl = await imagePath.getDownloadURL();
    }
    if (banner != null) {
      final imagePath = _storageInstance
          .ref()
          .child('${banner.hashCode.toString()}-${banner.name}');
      await imagePath.putFile(File(banner.path));
      bannerDownloadUrl = await imagePath.getDownloadURL();
    }

    defaultAccount = {
      'Name': name,
      'School': school,
      'Study-year': year,
      'Profile-pic': profileDownloadUrl.isEmpty
          ? defaultAccount['Profile-pic']
          : profileDownloadUrl,
      'Banner-pic': bannerDownloadUrl.isEmpty
          ? defaultAccount['Banner-pic']
          : bannerDownloadUrl,
      'About-me': about ?? defaultAccount['About-me'],
      'Linkedin': linkedin ?? defaultAccount['Linkedin'],
      'Instagram': instagram ?? defaultAccount['Instagram'],
      'Facebook': facebook ?? defaultAccount['Facebook'],
    };
    await _firestoreInstance
        .collection('users')
        .doc(_instance.currentUser!.uid)
        .set(defaultAccount);
    notifyListeners();
    return;
  }
}
