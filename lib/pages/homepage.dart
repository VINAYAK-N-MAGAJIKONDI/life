import 'package:flutter/material.dart';
import 'map.dart';
import '../widgets/carasoul.dart';
import 'plastic.dart';
import 'donate.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Discover',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
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
          const SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' LATEST ',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ],
              ),

            ],
          ),
          const LatestCarousel(),

          const SizedBox(height: 16.0),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => donate()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.monetization_on,
                      color: Colors.black87,
                      size: 45.0,
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Fund a Solution',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 3.0),
                          Text(
                            'Fund/Donate for Good',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          const SizedBox(height: 16.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'EXPLORE',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  // Implement the action when the button is pressed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => plastic()),
                  );
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[200],
                  foregroundColor: Colors.black,
                ),
                child: const Text('View All'),
              ),
            ],
          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
            leading: Container(
              padding: const EdgeInsets.only(right: 12.0),
              decoration: const BoxDecoration(
                  border:  Border(
                      right: BorderSide(width: 1.0, color: Colors.blue))),
              child: const Icon(Icons.water_drop_sharp, color: Colors.lightBlue),
            ),
            title: Text(
              "Plastic Pollution and It's Impact",
              style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            subtitle: const Row(
              children: <Widget>[
                Text("A Global Environmental Issue.", style: TextStyle(color: Colors.indigo))
              ],
            ),


              ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
            leading: Container(
              padding: const EdgeInsets.only(right: 12.0),
              decoration: const BoxDecoration(
                  border: Border(
                      right: BorderSide(width: 1.0, color: Colors.blue))),
              child: const Icon(Icons.water_drop_sharp, color: Colors.lightBlue),
            ),
            title: Text(
              "App and Its Uses",
              style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            subtitle: const Row(
              children: <Widget>[
                Text("Know More about our App and it's Future", style: TextStyle(color: Colors.indigo))
              ],
            ),


          ),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
            leading: Container(
              padding: const EdgeInsets.only(right: 12.0),
              decoration: const BoxDecoration(
                  border: Border(
                      right: BorderSide(width: 1.0, color: Colors.blue))),
              child: const Icon(Icons.water_drop_sharp, color: Colors.lightBlue),
            ),
            title: Text(
              "Further Resources and Education",
              style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            subtitle: const Row(
              children: <Widget>[
                Text("Explore educational resources", style: TextStyle(color: Colors.indigo))
              ],
            ),


          ),




    ],
    ),
      ),
      );
  }
}
