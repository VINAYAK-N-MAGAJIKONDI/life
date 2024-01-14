import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'maps.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
          backgroundColor: Colors.blueAccent,
          // Set the background color to aqua blue
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
                  MaterialPageRoute(builder: (context) => MapsPage()),
                );
                // Do something when the button is tapped
              },
            ),
            Text('ART AND CRAFTS:'),
            ListView(
              children: [
                SizedBox(height: 80,),
                CarouselSlider(items: [
                  Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://live.staticflickr.com/3484/3824082777_e5b41152dc_n.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(25),

                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://media.istockphoto.com/id/908255262/photo/traditional-moroccan-market-with-souvenirs.webp?b=1&s=170667a&w=0&k=20&c=fjiXOH2EuAR4BhVZXJBpsQgtd1ssQ15MgrMfsIgw45o='),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(25),

                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://media.istockphoto.com/id/517377154/photo/elephant-toys-in-the-shop.webp?b=1&s=170667a&w=0&k=20&c=kJoY1Yh9mOmk0xma7SFBM7FetZ8hoeV8AHJ2ZWHV_OI='),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(25),

                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://images.unsplash.com/photo-1606689518099-4437c5dd3b21?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTh8MTE0Nzg5MHx8ZW58MHx8fHx8'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(25),

                    ),
                  ),

                ], options: CarouselOptions(
                  height: 180,
                  aspectRatio: 16/8,
                  viewportFraction: 8.6,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(microseconds: 800),
                  reverse: true,


                 ))

              ],
            ),
          ],
        ),

    );
  }
}
