import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'map.dart';
import 'art.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Discover Projects',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CleanupLocationsScreen()),
              );
            },
            child: Image.network(
              'https://i.imgur.com/Pf1B3Q1.jpeg',
              fit: BoxFit.contain,
              width: 300,
              height: 150,
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Arts and Crafts',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  // Implement the action when the button is pressed
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => art()),
    );
    },

                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
                child: Text('View All'),
              ),
            ],
          ),
          CarouselSlider(
            items: [
              Image.network(
                'https://live.staticflickr.com/3484/3824082777_e5b41152dc_n.jpg',
                fit: BoxFit.cover,
              ),
              // Add more images as needed
            ],
            options: CarouselOptions(
              height: 180,
              aspectRatio: 16 / 8,
              viewportFraction: 0.8,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              reverse: true,
            ),
          ),
        ],
      ),
    );
  }
}
