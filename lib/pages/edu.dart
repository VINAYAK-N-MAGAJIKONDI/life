import 'package:flutter/material.dart';
import 'plastic.dart';
import 'appuses.dart';
import 'resources.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';




class edu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EDUCATIONAL RESOURCES'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // First Row: Plastic Pollution and Its Impact
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Plastic Pollution and Its Impact',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Plastic pollution is a global environmental issue. It harms marine life, disrupts ecosystems, and affects human health. We must reduce plastic waste and promote sustainable alternatives.',
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
            onPressed: () {
              // Implement the action when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => plastic()),
              );
            },

            style: TextButton.styleFrom(
              textStyle: TextStyle(
                color: Colors.blueAccent,
              ),
            ),
            child: Text('View'),
          ),

          // Second Row: App and Its Uses
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'App and Its Uses',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Our app provides information on plastic pollution, recycling tips, and eco-friendly alternatives. Users can track their plastic usage and learn how to make a positive impact.',
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
            onPressed: () {
              // Implement the action when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => appuses()),
              );
            },

            style: TextButton.styleFrom(
              textStyle: TextStyle(
                color: Colors.blueAccent,
              ),
            ),
            child: Text('View'),
          ),

          // Third Row: Further Resources and Education
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Further Resources and Education',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Explore our educational resources, articles, and videos. Learn about sustainable living, participate in clean-up drives, and spread awareness about plastic pollution.',
              textAlign: TextAlign.center,
            ),
          ),
          TextButton(
            onPressed: () {
              // Implement the action when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => resources()),
              );
            },

            style: TextButton.styleFrom(
              textStyle: TextStyle(
                color: Colors.blueAccent,
              ),
            ),
            child: Text('View'),
          ),
        ],
      ),

    );}}



