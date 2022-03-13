import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './home_screen.dart';
import './login_screen.dart';
import '../providers/user.dart';

class SelectorScreen extends StatelessWidget {
  const SelectorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Returns the login screen if the user is not logged in
    // and the Home screen if he is
    return Provider.of<User>(context).isLoggedIn
        ? const HomeScreen()
        : const LoginScreen();
  }
}
