import 'package:flutter/material.dart';
class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
          onTap: () {
      // do something when the button is pressed
    },
            child: Stack(
          children: [
               Image(
                 image: NetworkImage('https://t3.ftcdn.net/jpg/00/35/84/88/160_F_35848809_NDtD2U8xbxDL1TW4e2qWR1HX0ZIi12aF.jpg'), //profile bar
                  width: 200,
                  height: 100,
             ),
            ],
          ),
          ),
          InkWell(
            onTap: () {
    // do something when the button is pressed
    },
             child: Stack(
             children: [
                 Image(
                    image: NetworkImage('https://www.carnegiefoundation.org/wp-content/uploads/2022/03/New-Bizz-Featured-Image.png'), //join community bar
                    width: 200,
                    height: 100,
       ),
          ],
          ),
          ),
          InkWell(
              onTap: () {
              // do something when the button is pressed
              },
              child: Stack(
              children: [
                  Image(
                    image: NetworkImage('https://industryvisuals.com/wp-content/uploads/2018/10/Recycle-plastic-768x761.png'),//recycle plastic bar
                    width: 200,
                    height: 100,
              ),
               ],
              ),
                      ),
            InkWell(
            onTap: () {
            // do something when the button is pressed
            },
                child: Stack(
                children: [
                    Image(
                      image: NetworkImage('https://static.vecteezy.com/system/resources/previews/000/412/173/non_2x/people-with-education-related-icons-vector.jpg'), //education
                      width: 200,
                      height: 100,
              ),
              ],
                ),
                  ),


                ],
      ),
    );
  }
}
