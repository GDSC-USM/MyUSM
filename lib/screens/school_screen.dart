import 'package:flutter/material.dart';

class SchoolScreen extends StatelessWidget {
  static const String routeName = '/school';

  final String title;
  const SchoolScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
