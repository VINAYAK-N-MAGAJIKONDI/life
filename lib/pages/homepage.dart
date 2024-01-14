import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'map.dart';
import 'art.dart';
import 'edu.dart';
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
              Image.network('https://media.istockphoto.com/id/908255262/photo/traditional-moroccan-market-with-souvenirs.webp?b=1&s=170667a&w=0&k=20&c=fjiXOH2EuAR4BhVZXJBpsQgtd1ssQ15MgrMfsIgw45o=',
              fit: BoxFit.cover,
              ),
              Image.network('https://media.istockphoto.com/id/517377154/photo/elephant-toys-in-the-shop.webp?b=1&s=170667a&w=0&k=20&c=kJoY1Yh9mOmk0xma7SFBM7FetZ8hoeV8AHJ2ZWHV_OI=',
                fit: BoxFit.cover,
              ),
              Image.network('https://images.unsplash.com/photo-1606689518099-4437c5dd3b21?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTh8MTE0Nzg5MHx8ZW58MHx8fHx8',
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' Educational Resources',
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
                    MaterialPageRoute(builder: (context) => edu()),
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
        ],
      ),
    );
  }
}
