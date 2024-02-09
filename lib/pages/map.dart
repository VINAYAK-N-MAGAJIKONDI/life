import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



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
  final List<CleanupLocation> cleanupLocations = [
    CleanupLocation(
      name: "Puri Beach",
      date: "Jan 1, 2024,",
      time: "10:00 AM - 12:00 PM",
      description: "Odisha, India",
      mapUrl: "https://maps.google.com/?q=37.7749,-122.4194",
      imageUrl: "https://images.unsplash.com/photo-1643105131526-de365de93e5e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NXxXY3B1YjM1cklMSXx8ZW58MHx8fHx8",
      organizer: "Organizer: Ramesh Chaudary",
      contact: "Contact: 9835712407",
    ),
    CleanupLocation(
      name: "Juhu Beach",
      date: "Jan 22, 2024,",
      time: "10:00 AM - 12:00 PM",
      description: "Mumbai, India",
      mapUrl: "https://maps.google.com/?q=37.7749,-122.4194",
      imageUrl: "https://images.unsplash.com/photo-1706547482914-15195bc390e6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MnxJeU1HaUtaSTBEb3x8ZW58MHx8fHx8",
      organizer: "Organizer: Karan Datta",
      contact: "Contact: 7016429813",
    ),
    CleanupLocation(
      name: "Marina Beach",
      date: "Feb 18, 2024,",
      time: "10:00 AM - 12:00 PM",
      description: "Chennai, India",
      mapUrl: "https://maps.google.com/?q=37.7749,-122.4194",
      imageUrl: "https://media.istockphoto.com/id/1457035494/photo/calm-marina-beach-seascape-in-chennai-india.webp?b=1&s=170667a&w=0&k=20&c=39aDPmUrTRmSJ6Vbx-i4tW8-_i8XEiSVlEt5GxytN-Y=",
      organizer: "Organizer: Omkar Rao",
      contact: "Contact: 8324159607",
    ),
    CleanupLocation(
      name: "Calangute Beach",
      date: "Feb 23, 2024,",
      time: "10:00 AM - 12:00 PM",
      description: "Goa, India",
      mapUrl: "https://maps.google.com/?q=37.7749,-122.4194",
      imageUrl: "https://media.istockphoto.com/id/859845026/photo/beach-in-goa-india.webp?b=1&s=170667a&w=0&k=20&c=sESihqkRg7XFBVnnAw8FTL2dCoOCB1-juq29Vs6iwE8=",
      organizer: "Organizer: Suman Jha",
      contact: "Contact: 9813814562",
    ),
    CleanupLocation(
      name: "Digha Beach",
      date: "Mar 06, 2024,",
      time: "10:00 AM - 12:00 PM",
      description: "West Bengal, India",
      mapUrl: "https://maps.google.com/?q=37.7749,-122.4194",
      imageUrl: "https://media.istockphoto.com/id/1400288966/photo/pine-forest-on-sand-beach-of-some-sea-side-at-the-coastal-area-of-digha-west-bengal-india.webp?b=1&s=170667a&w=0&k=20&c=aqhGQDNPk7yR3-9Ew-L5sfJM2f6Dw7oUkSgkxMleFBY=",
      organizer: "Organizer: Alauddin Zirfa",
      contact: "Contact: 7048092761",
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
            leading: Image.network(
              cleanupLocations[index].imageUrl,
              width: 150, // Adjust the width as needed
              height: 500, // Adjust the height as needed
              fit: BoxFit.cover, // You can use BoxFit.contain, BoxFit.fill, or other BoxFit values
            ),

            title: Text(cleanupLocations[index].name, style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue[800],
              decoration: TextDecoration.underline,
            ),),
            subtitle: Text("${cleanupLocations[index].description}\n ${cleanupLocations[index].date} ${cleanupLocations[index].time}\n${cleanupLocations[index].organizer} \n${cleanupLocations[index].contact} ", style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
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
