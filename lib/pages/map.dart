import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CleanupLocation {
  final String name;
  final String date;
  final String time;
  final String description;
  final String mapUrl;
  final String imageUrl;
  final String organizer;
  final String contact;

  CleanupLocation({
    required this.name,
    required this.date,
    required this.time,
    required this.description,
    required this.mapUrl,
    required this.imageUrl,
    required this.organizer,
    required this.contact,
  });
}

class CleanupLocationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cleanup Locations"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("locations").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No cleanup locations found'));
          } else {
            List<Widget> locationWidgets = snapshot.data!.docs.map((doc) {
              Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
              print(data);
              return _buildCleanupLocationCard(
                context,
                CleanupLocation(
                  imageUrl: data['imgurl'],
                  description: data['description'],
                  name: data['name'],
                  date: data['date'],
                  time: data['time'],
                  organizer: data['organizer'],
                  contact: data['contact'],
                  mapUrl: data['mapurl'],
                ),
              );
            }).toList();

            return ListView(
              children: locationWidgets,
            );
          }
        },
      ),
    );
  }

  Widget _buildCleanupLocationCard(BuildContext context, CleanupLocation location) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8.0), // Add padding for ListTile
        child: ListTile(
          contentPadding: EdgeInsets.zero, // Remove default padding from ListTile
          leading: SizedBox(
            width: 100, // Width of the image
            height: 150, // Height of the image
            child: Image.network(
              location.imageUrl,
              fit: BoxFit.cover, // Fill the entire space
            ),
          ),
          title: Text(
            location.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          subtitle: Text(
            "${location.description}\nDate: ${location.date} Time: ${location.time}\nOrganizer: ${location.organizer} \nContact: ${location.contact} ",
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          onTap: () => _launchMap(context, location),
        ),
      ),
    );
  }


  Future<void> _launchMap(BuildContext context, CleanupLocation location) async {
    String mapUrl = location.mapUrl;

    if (await canLaunch(mapUrl)) {
      await launch(mapUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not open the Maps app'),
        ),
      );
    }
  }
}
