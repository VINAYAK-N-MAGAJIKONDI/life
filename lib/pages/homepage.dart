import 'package:flutter/material.dart';
import 'map.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
        Colors.blueAccent, // Set the background color to aqua blue
        title: Text(
          'Discover Projects',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Set text to bold
            color: Colors.white, // Set text color to white
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CleanupLocationsScreen()),
              );
              // Do something when the button is tapped
            },
            child: Ink.image(
              image: NetworkImage(
                  'https://i.imgur.com/Pf1B3Q1.jpeg'), // Use AssetImage to load the image
              fit: BoxFit.contain,
              width: 300,
              height: 150,
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
                // Do something when the button is tapped
              },
              child: Ink.image(
                image: NetworkImage(
                    'https://www.carnegiefoundation.org/wp-content/uploads/2022/03/New-Bizz-Featured-Image.png'),
                fit: BoxFit.cover,
                width: 200,
                height: 100,
              ),
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
                // Do something when the button is tapped
              },
              child: Ink.image(
                image: NetworkImage(
                    'https://www.carnegiefoundation.org/wp-content/uploads/2022/03/New-Bizz-Featured-Image.png'),
                fit: BoxFit.cover,
                width: 200,
                height: 100,
              ),
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
                // do something when the button is pressed
              },
              child: Stack(
                children: [
                  Image(
                    image: NetworkImage(
                        'https://static.vecteezy.com/system/resources/previews/000/412/173/non_2x/people-with-education-related-icons-vector.jpg'), //education
                    width: 200,
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
