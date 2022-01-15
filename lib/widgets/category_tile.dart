import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String name;
  final String destination;

  const CategoryTile({
    Key? key,
    required this.name,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Add more detail to this once you decide on a design for them
    return Container(
      padding: const EdgeInsets.all(5),
      height: 150,
      width: 200,
      color: Colors.brown,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () =>
              Navigator.of(context).pushNamed(destination, arguments: name),
          child: Center(
            child: Text(name),
          ),
        ),
      ),
    );
  }
}
