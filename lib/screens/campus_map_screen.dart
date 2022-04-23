import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_usm/widgets/app_bar.dart';

/// Creates a page that shows the main campus on google maps
class CampusMapScreen extends StatefulWidget {
  static const String routeName = '/map';

  const CampusMapScreen({Key? key, required title})
      : _title = title,
        super(key: key);

  // Title to display (name of the campus)
  final String _title;

  @override
  State<CampusMapScreen> createState() => _CampusMapScreenState();
}

class _CampusMapScreenState extends State<CampusMapScreen> {
  // Returns the appropriate location based on the name of the campus
  LatLng get campusCoords {
    switch (widget._title) {
      case 'Health Campus':
        return const LatLng(6.100380354793856, 102.28537264028867);
      case 'Engineering Campus':
        return const LatLng(5.146698871826737, 100.49287998503502);
      // If not health or engineering campus, then return main campus location
      default:
        return const LatLng(5.3559635793900195, 100.30252521841517);
    }
  }

  // These two items are needed for the map to be created
  // Don't mess with them unless you know what you're doing!
  final Completer<GoogleMapController> _controller = Completer();
  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  // A function to change the map type
  bool _satelliteMap = false;
  void _changeMapType() {
    setState(() {
      _satelliteMap = !_satelliteMap;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The app bar
      appBar: UpperNavBar(title: '${widget._title}\'s map').build(context),
      // The actual map
      body: GoogleMap(
        // Function for when the map is created
        onMapCreated: _onMapCreated,
        // For switching the map types
        mapType: _satelliteMap ? MapType.satellite : MapType.normal,
        // Where the camera is initially pointing at
        initialCameraPosition: CameraPosition(
          target: campusCoords,
          zoom: 18.0,
        ),
      ),
      // The FAB details
      floatingActionButton: FloatingActionButton(
        onPressed: () => _changeMapType(),
        child: const Icon(Icons.map),
        backgroundColor: const Color.fromARGB(255, 39, 38, 53),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }
}
