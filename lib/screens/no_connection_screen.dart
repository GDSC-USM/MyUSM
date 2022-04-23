import 'package:flutter/material.dart';
import 'package:my_usm/widgets/app_bar.dart';

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperNavBar(title: "No connection").build(context),
      body: const Center(
        child: Text('Turn on wifi!!!'),
      ),
    );
  }
}
