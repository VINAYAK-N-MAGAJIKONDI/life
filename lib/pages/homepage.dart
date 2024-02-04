import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'map.dart';
import 'art.dart';
import 'edu.dart';
import 'plastic.dart';
import 'appuses.dart';
import 'resources.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> imageUrls = [
    'https://www.ukri.org/wp-content/uploads/2020/11/UKRI-171120-UKRI-invests-20m-to-tackle-plastic-waste.jpg',
    'https://blog.getcova.com/blog/content/images/2022/10/Cova-app.png',
    'https://th.bing.com/th/id/R.6b9195a56dc748f028f4daffc4e5ab5c?rik=ixlBQDvXcC4Fiw&riu=http%3a%2f%2frefillambassadors.com%2fwp-content%2fuploads%2f2020%2f09%2foceancleanup-portada.jpg&ehk=to4q4W5l%2b%2fikk2HxeWv3D2BtQcfTmkJVG9JOOIhmA74%3d&risl=&pid=ImgRaw&r=0',
    // Add more image URLs here
  ];

  final List titles = [
    'Plastic Pollution and Its Impact',
    'Know More about our App',
    'Further Resources and Education',
  ];
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
            ],
          ),

              Container(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.0,
                  mainAxisSpacing: 25,
                  ),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => plastic()));
                        } else if (index == 1) {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => appuses()));
                        } else if (index == 2) {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => resources()));
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric (vertical: 20, horizontal: 12),

                      child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                        Image.network(imageUrls[index],
                  width: 112,
                  ),
                        Text(
                  titles[index],
                  style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  ),
    )
    ],
    ),
    ),
    );
    },
    ),

    ),
    ],
    ),
      );
  }
}
