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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
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
                    'Arts and Crafts',
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
                  MaterialPageRoute(builder: (context) => art()),
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
                  color: Colors.yellow[800],
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
                    ' Educational Resources',
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
                    Text("Plastic Pollution - A Global Environmental Issue.", style: TextStyle(color: Colors.indigo))
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
                  Text("Explore educational resources, articles, and videos.", style: TextStyle(color: Colors.indigo))
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
