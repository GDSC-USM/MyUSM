import 'package:flutter/material.dart';

/*
  Left out this import for the time being, still working on restructuring
  the folders
*/
// import '../screens/campus_screen.dart';


class CampusTile extends StatelessWidget {
  final String name;
  final String image;

  const CampusTile({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 150,
      width: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Image.asset(
              image,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 10,
              left: 5,
              child: Container(
                color: Colors.black,
                child: Text(
                  name,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
