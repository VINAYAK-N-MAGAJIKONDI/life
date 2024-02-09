import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'map.dart';
import 'art.dart';
import 'plastic.dart';
import 'donate.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  final List<String> imageUrls = [
    'https://images.unsplash.com/photo-1633319377690-fa954d0fb59c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NHxSR3dYMmJMZnZLTXx8ZW58MHx8fHx8',
    'https://media.istockphoto.com/id/1004792742/photo/megalodon-scene-3d-illustration.jpg?s=612x612&w=0&k=20&c=32FRpoHx1Ff1o1FU2OPr1twOftSeuYhTpofqz_DSPK8=',
    'https://images.unsplash.com/photo-1581446825137-f07a81380ead?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXw2Mjc1NjN8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1575467252250-c0e889b69d2b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fEdNJTIwQkFDVEVSSUF8ZW58MHx8MHx8fDA%3D',
  ];

  final List<String> titles = [
    'Great Barrier reef Coral spawning',
    'Shark Attacks',
    'Microparticles in Marine Snow',
    'Genetically Modified Bacteria',
  ];

  final List<String> descriptions = [
    'Climate change is significantly impacting\n the Great Barrier Reef,\n including its coral spawning events.',
    'An increase in unprovoked shark attacks\n worldwide in 2023 compared\n to the previous year.',
    'These tiny particles pose a threat to marine\n ecosystems and contribute to pollution\n affecting arctic food web.',
    'Researchers have genetically modified a marine\n bacterium called Vibrio natriegens\n to break down plastic in saline water.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
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
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'LATEST ',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                ],
              ),

            ],
          ),
          CarouselSlider(
            items: imageUrls.map((imageUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 0.0),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                        ),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              titles[_currentIndex],
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              descriptions[_currentIndex],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 250,
              aspectRatio: 5 / 8,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),

          SizedBox(height: 16.0),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => donate()),
                );
              },
              child: Container(
                padding: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  color: Colors.green[600],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.monetization_on,
                      color: Colors.white,
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
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 3.0),
                          Text(
                            'Fund/Donate for Good',
                            style: TextStyle(
                              color: Colors.white,
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

          SizedBox(height: 16.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                child: Text('View All'),
              ),
            ],
          ),
          Container(
              child:  ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          right: new BorderSide(width: 1.0, color: Colors.blue))),
                  child: Icon(Icons.water_drop_sharp, color: Colors.lightBlue),
                ),
                title: Text(
                  "Plastic Pollution and It's Impact",
                  style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
                ),
                // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                subtitle: Row(
                  children: <Widget>[
                    Text("A Global Environmental Issue.", style: TextStyle(color: Colors.indigo))
                  ],
                ),


    ),
          ),
          Container(
            child:  ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right: new BorderSide(width: 1.0, color: Colors.blue))),
                child: Icon(Icons.water_drop_sharp, color: Colors.lightBlue),
              ),
              title: Text(
                "App and Its Uses",
                style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
              ),
              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

              subtitle: Row(
                children: <Widget>[
                  Text("Know More about our App and it's Future", style: TextStyle(color: Colors.indigo))
                ],
              ),


            ),
          ),
          Container(
            child:  ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right: new BorderSide(width: 1.0, color: Colors.blue))),
                child: Icon(Icons.water_drop_sharp, color: Colors.lightBlue),
              ),
              title: Text(
                "Further Resources and Education",
                style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
              ),
              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

              subtitle: Row(
                children: <Widget>[
                  Text("Explore educational resources", style: TextStyle(color: Colors.indigo))
                ],
              ),


            ),
          ),




    ],
    ),
      ),
      );
  }
}
