import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarouselData {
  final String title;
  final String description;
  final String imageUrl;

  CarouselData({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class LatestCarousel extends StatefulWidget {
  const LatestCarousel({Key? key}) : super(key: key);

  @override
  State<LatestCarousel> createState() => _LatestCarouselState();
}

class _LatestCarouselState extends State<LatestCarousel> {

  List<CarouselData> carouselDataList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection("carouselData").get();
    setState(() {
      carouselDataList = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return CarouselData(
          title: data['title'],
          description: data['description'],
          imageUrl: data['imageUrl'],
        );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: carouselDataList.map((data) {
        return Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 0.0),
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                  ),
                  child: Image.network(
                    data.imageUrl,
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
                        data.title,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        data.description,
                        style: const TextStyle(
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
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        onPageChanged: (index, reason) {
          setState(() {
          });
        },
      ),
    );
  }
}
