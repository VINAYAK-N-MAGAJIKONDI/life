import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class plastic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Explore'),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back), // Add arrow back icon
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),// Change app bar color
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
          videoUrl: "https://youtu.be/ODni_Bey154?si=6UWlpALShu-rYRy7",
          backgroundColor: Colors.white38,
          // Change section background color
         // Add an icon
        ),
        SectionWidget(
          title: "Impact on Marine Life",
          content: "Discover how plastic pollution affects marine ecosystems...",
          videoUrl: "https://youtu.be/qiXRTA0tYoI?feature=shared",
          backgroundColor: Colors.white38,
          // Change section background color

        ),
        SectionWidget(
          title: "Solutions to Plastic Pollution",
          content: "Explore solutions to reduce plastic pollution...",
          videoUrl: "https://youtu.be/NTbNRL0XNVQ?feature=shared",
          backgroundColor: Colors.white38,
          // Change section background color

        ),
        SectionWidget(
          title: "App uses",
          content: "How to keep plastic out of ocean",
          videoUrl: "https://youtu.be/HQTUWK7CM-Y?si=-m4HAM12MOR0uSlQ",
          backgroundColor: Colors.white38,
          // Change section background color

        ),
        SectionWidget(
          title: "Additional resources",
          content: "The some of additional resourses",
          videoUrl: "https://youtu.be/Yomf5pBN8dY?si=HmZhEJTTnRqVZDqp",
          backgroundColor: Colors.white38,
          // Change section background color

        ),
        // Add more SectionWidget for additional sections
      ],
    );
  }
}

class SectionWidget extends StatelessWidget {
  final String title;
  final String content;
  final String? videoUrl; // Nullable string
  final Color backgroundColor;


  SectionWidget({
    required this.title,
    required this.content,
    required this.videoUrl,
    required this.backgroundColor,

  });

  @override
  Widget build(BuildContext context) {
    String? videoId = videoUrl != null ? YoutubePlayer.convertUrlToId(videoUrl!) : null;
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
          if (videoId != null)
            InkWell(
              onTap: () {
                _launchYoutubeVideo(videoUrl!);
              },
              child: Container(
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
            ),
        ],
      ),
    );
  }

  // Function to launch YouTube video
  void _launchYoutubeVideo(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
