import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';




class edu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EDUCATIONAL RESOURCES'),
      ),


      body: MyHomePage(),
    );}}

class MyHomePage extends StatelessWidget {
  final List<Map<String, String>> videoList = [
    {
      'title': 'Video 1',
      'url': 'https://www.youtube.com/watch?v=VIDEO_ID_1',
    },
    {
      'title': 'Video 2',
      'url': 'https://www.youtube.com/watch?v=VIDEO_ID_2',
    },
    {
      'title': 'Video 3',
      'url': 'https://www.youtube.com/watch?v=VIDEO_ID_3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Videos'),
      ),
      body: ListView.builder(
        itemCount: videoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(videoList[index]['title']!),
            onTap: () => _launchURL(videoList[index]['url']!),
          );
        },
      ),
    );
  }

  _launchURL(String url) async {
    String url = videoList.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not launch the url '),
          ),);
    }
  }
}



