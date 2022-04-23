import 'package:flutter/material.dart';

class UpperNavBar extends StatelessWidget {
  final String title;
  const UpperNavBar({Key? key, required this.title}) : super(key: key);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Color.fromARGB(255, 243, 239, 245)
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 39, 38, 53),
    );
  }
}
