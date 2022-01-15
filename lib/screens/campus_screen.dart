import 'package:flutter/material.dart';

import './society_screen.dart';
import './school_screen.dart';
import '../widgets/category_tile.dart';

class CampusScreen extends StatelessWidget {
  static const String routeName = '/campus';

  final String title;

  const CampusScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        // Remove this and wrap with SingleChildScrollView if you wish for the page to be scrollable
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // The schools area
          const Text('Schools'),
          _scrollableArea(
            // Replce this with a list of the available schools
            [
              const CategoryTile(
                name: 'Computer Science',
                destination: SchoolScreen.routeName,
              )
            ],
          ),
          // The societies area
          const Text('Societies'),
          _scrollableArea(
            // Replace this with a list of available socities
            [
              const CategoryTile(
                name: 'CS society',
                destination: SocietyScreen.routeName,
              )
            ],
          ),
        ],
      ),
    );
  }
}

// A helper function to build the two scrollable areas for school and campus
Widget _scrollableArea(List<CategoryTile> widgets) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: widgets,
    ),
  );
}
