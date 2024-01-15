import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('EDUCATIONAL RESOURCES'),
        ),
        body: Center(
          child: MyYouTubePlayer(),
        ),
      ),
    );
  }
}

class MyYouTubePlayer extends StatefulWidget {
  @override
  _MyYouTubePlayerState createState() => _MyYouTubePlayerState();
}

class _MyYouTubePlayerState extends State<MyYouTubePlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: 'iLnmTe5Q2Qw',
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
       // videoProgressIndicatorColor: Colors.amber,

        onReady: () {
          // You can add any onReady logic here
        },
      ),
      builder: (context, player) {
        return Column(
          children: [
            // Some other widgets can be added above the player if needed
            player,
            // Some other widgets can be added below the player if needed
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}