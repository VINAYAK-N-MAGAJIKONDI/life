import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class RecyclingMapWidget extends StatefulWidget {
  @override
  _RecyclingMapWidgetState createState() => _RecyclingMapWidgetState();
}

class _RecyclingMapWidgetState extends State<RecyclingMapWidget> {
  GoogleMapController mapController;
  LatLng userLocation;
  List<LatLng> recyclingUnits = [];

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    _getNearestRecyclingUnits();
  }

  Future<void> _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      userLocation = LatLng(position.latitude, position.longitude);
    });
  }

  Future<void> _getNearestRecyclingUnits() async {
    // Replace the API endpoint with your actual endpoint for fetching recycling units
    final apiUrl = 'https://api.example.com/recycling_units';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        recyclingUnits = data
            .map((unit) => LatLng(unit['latitude'], unit['longitude']))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recycling Map'),
      ),
      body: userLocation == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
        onMapCreated: (controller) => mapController = controller,
        initialCameraPosition: CameraPosition(
          target: userLocation,
          zoom: 14.0,
        ),
        markers: <Marker>[
          Marker(
            markerId: MarkerId('user_location'),
            position: userLocation,
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueBlue),
            infoWindow: InfoWindow(title: 'Your Location'),
          ),
          ...recyclingUnits.map(
                (unit) => Marker(
              markerId: MarkerId('${unit.latitude}_${unit.longitude}'),
              position: unit,
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueGreen),
              infoWindow: InfoWindow(title: 'Recycling Unit'),
            ),
          ),
        ].toSet(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openMapsForDirections();
        },
        child: Icon(Icons.directions),
      ),
    );
  }

  Future<void> _openMapsForDirections() async {
    final availableMaps = await MapLauncher.installedMaps;
    if (availableMaps.isNotEmpty) {
      await MapLauncher.launchDirections(
        destination: Coords(
          recyclingUnits.first.latitude,
          recyclingUnits.first.longitude,
        ),
      );
    } else {
      // Handle case when no maps app is installed
      // You can provide an alternative solution like showing a dialog
      print("No maps app installed");
    }
  }
}
