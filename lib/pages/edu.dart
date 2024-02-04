import 'package:flutter/material.dart';
import 'plastic.dart';
import 'appuses.dart';
import 'resources.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:url_launcher/url_launcher.dart';




class edu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      title: 'EDUCATIONAL RESOURCES',
      theme: appTheme,
    );
  }
}
ThemeData appTheme = ThemeData(
  fontFamily: 'Oxygen',
  primaryColor: Colors.purpleAccent,
);

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EDUCATIONAL RESOURCES'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          CurvedListItem(
            title: 'Plastic Pollution and Its Impact',
            time: 'Plastic pollution - a global environmental issue.',
            color: Colors.red,
            nextColor: Colors.yellow,
            icon: Icons.info,
            people:'' ,
          ),
          ElevatedButton(
            onPressed: () {
              // Implement the action when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => plastic()),
              );
            },


            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: Text('View'),
          ),
          CurvedListItem(
            title: 'App and Its Uses',
            time: ' Information on plastic pollution, recycling tips, and many more',
            color: Colors.green,
            nextColor: Colors.yellow,
              icon: Icons.info,
              people:''
          ),
          ElevatedButton(
            onPressed: () {
              // Implement the action when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => appuses()),
              );
            },

            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
            child: Text('View'),
          ),
          CurvedListItem(
            title: 'Further Resources and Education',
            time: 'Explore our educational resources, articles, and videos.',
            color: Colors.blue, nextColor: Colors.yellow,
              icon: Icons.info,
              people:''
          ),
          ElevatedButton(
            onPressed: () {
              // Implement the action when the button is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => resources()),
              );
            },

            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            child: Text('View'),
          ),
        ],
      ),
    );
  }
}

class CurvedListItem extends StatelessWidget {
  const CurvedListItem({
    required this.title,
    required this.time,
    required this.icon,
    required this.people,
    required this.color,
    required this.nextColor,
  });

  final String title;
  final String time;
  final String people;
  final IconData icon;
  final Color color;
  final Color nextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: nextColor,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(80.0),
          ),
        ),
        padding: const EdgeInsets.only(
          left: 32,
          top: 80.0,
          bottom: 50,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                time,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),

              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Row(),
            ]),
      ),
    );
  }
}



