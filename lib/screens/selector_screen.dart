import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import './home_screen.dart';
import './login_screen.dart';
import './no_connection_screen.dart';
import '../providers/user.dart';

class SelectorScreen extends StatelessWidget {
  const SelectorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // Listen to changes in the connectivity state of the phone
      stream: Connectivity().onConnectivityChanged,
      builder: (_, snapshot) {
        // If user is not connected to anything
        if (snapshot.connectionState == ConnectionState.active) {
          var result = snapshot.data as ConnectivityResult;
          if (result == ConnectivityResult.none) {
            // Return page asking for wifi
            return const NoConnectionScreen();
          } else {
            // return the normal page
            return Provider.of<User>(context).isLoggedIn
                ? const HomeScreen()
                : const LoginScreen();
          }
        } else {
          // Don't do anything
          return const CircularProgressIndicator.adaptive();
        }
      },
    );
  }
}
