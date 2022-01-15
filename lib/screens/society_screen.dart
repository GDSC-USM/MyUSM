import 'package:flutter/material.dart';

class SocietyScreen extends StatelessWidget {
  static const String routeName = '/society';

  final String title;
  const SocietyScreen({
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
