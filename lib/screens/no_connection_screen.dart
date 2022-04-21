import 'package:flutter/material.dart';

// TODO: implmenet this screen
class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Turn on wifi!!!'),
      ),
    );
  }
}
