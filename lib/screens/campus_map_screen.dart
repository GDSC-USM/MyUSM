import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Creates a page that shows the main campus on google maps
class CampusMapScreen extends StatefulWidget {
  static const String routeName = '/map';

  const CampusMapScreen({Key? key, required title})
      : _title = title,
        super(key: key);

  // Title to display (name of the campus)
  final String _title;
  // Location of the main campus
  static const LatLng _center = LatLng(5.3559635793900195, 100.30252521841517);

  @override
  State<CampusMapScreen> createState() => _CampusMapScreenState();
}

class _CampusMapScreenState extends State<CampusMapScreen> {
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
      appBar: AppBar(
        title: Text('${widget._title}\'s map'),
      ),
      // The actual map
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        mapType: _satelliteMap ? MapType.satellite : MapType.normal,
        initialCameraPosition: const CameraPosition(
          target: CampusMapScreen._center,
          zoom: 18.0,
        ),
      ),
      // The FAB details
      floatingActionButton: FloatingActionButton(
        onPressed: () => _changeMapType(),
        child: const Icon(Icons.map),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
    );
  }
}
