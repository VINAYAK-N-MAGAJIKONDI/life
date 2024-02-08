import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class plastic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Explore'),
          backgroundColor: Colors.blue, // Change app bar color
        ),
        body: FeedPage(),
      ),
    );
  }
}

class FeedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SectionWidget(
          title: "Causes of Plastic Pollution",
          content: "Learn about the various causes of plastic pollution...",
          videoId: "VIDEO_ID_1",
          backgroundColor: Colors.white70, // Change section background color
          icon: Icons.eco, // Add an icon
        ),
        SectionWidget(
          title: "Impact on Marine Life",
          content: "Discover how plastic pollution affects marine ecosystems...",
          videoId: "VIDEO_ID_2",
          backgroundColor: Colors.white30, // Change section background color
          icon: Icons.water_damage, // Add an icon
        ),
        SectionWidget(
          title: "Solutions to Plastic Pollution",
          content: "Explore solutions to reduce plastic pollution...",
          videoId: "VIDEO_ID_3",
          backgroundColor: Colors.white38, // Change section background color
          icon: Icons.cleaning_services, // Add an icon
        ),
        SectionWidget(
          title: "App uses",
          content: "what is the uses of our app",
          videoId: "VIDEO_ID_2",
          backgroundColor: Colors.white54, // Change section background color
          icon: Icons.beach_access, // Add an icon
        ),
        SectionWidget(
          title: "Additional resources",
          content: "The some of additional resourses",
          videoId: "VIDEO_ID_2",
          backgroundColor: Colors.white60, // Change section background color
          icon: Icons.book, // Add an icon
        ),
        // Add more SectionWidget for additional sections
      ],
    );
  }
}

class SectionWidget extends StatelessWidget {
  final String title;
  final String content;
  final String videoId;
  final Color backgroundColor;
  final IconData icon;

  SectionWidget({
    required this.title,
    required this.content,
    required this.videoId,
    required this.backgroundColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.black87), // Display icon
              SizedBox(width: 10.0),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87), // Change text color
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            content,
            style: TextStyle(color: Colors.black87), // Change text color
          ),
          SizedBox(height: 12.0),
          Container(
            height: 200,
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: videoId,
                flags: YoutubePlayerFlags(
                  autoPlay: false,
                  mute: false,
                ),
              ),
              showVideoProgressIndicator: true,
            ),
          ),
        ],
      ),
    );
  }
}
