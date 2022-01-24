import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User with ChangeNotifier {
  // Instance of the current user
  final _instance = FirebaseAuth.instance;

  bool isLoggedIn() {
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
      // In case anything goes wrong, this is some basic error catching
      // You can expand onto it later if you want to
      ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: const Text('An error occured'),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
    }
    notifyListeners();
  }

  Future<void> login(String email, String password, BuildContext ctx) async {
    try {
      // Logs the user in
      await _instance.signInWithEmailAndPassword(
          email: email, password: password);
      notifyListeners();
    } catch (err) {
      // Some basic error catching
      ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: const Text('An error occured'),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
    }
  }
}
