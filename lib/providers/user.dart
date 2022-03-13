import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class User with ChangeNotifier {
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
      String message = 'An error occured';
      // Check if error is from firebaseAuth. If so, set the error message accordingly.
      if (err.runtimeType == FirebaseAuthException) {
        FirebaseAuthException error = err as FirebaseAuthException;
        message = error.message!;
      }
      _showErrorMessage(message, ctx);
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
}
