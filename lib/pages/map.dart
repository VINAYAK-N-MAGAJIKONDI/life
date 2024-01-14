import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class CleanupLocation {
  final String name;
  final String date;
  final String time;
  final String description;
  final String mapUrl;

  CleanupLocation({
    required this.name,
    required this.date,
    required this.time,
    required this.description,
    required this.mapUrl,
  });
}



class CleanupLocationsScreen extends StatelessWidget {
  final List<CleanupLocation> cleanupLocations = [
    CleanupLocation(
      name: "Beach Cleanup",
      date: "January 1, 2024",
      time: "10:00 AM - 12:00 PM",
      description: "Join us for a community beach cleanup!",
      mapUrl: "https://maps.google.com/?q=37.7749,-122.4194",
    ),
    // Add more cleanup locations as needed
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cleanup Locations"),
      ),
      body: ListView.builder(
        itemCount: cleanupLocations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cleanupLocations[index].name),
            subtitle: Text("${cleanupLocations[index].date} ${cleanupLocations[index].time}"),
            onTap: () => _launchMap(context, cleanupLocations[index]),
          );
        },
      ),
    );
  }

  Future<void> _launchMap(BuildContext context, CleanupLocation location) async {
    String mapUrl = location.mapUrl;

    if (await canLaunch(mapUrl)) {
      await launch(mapUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not open the Maps app'),
        ),
      );
    }
  }
}
