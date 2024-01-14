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
      appBar: AppBar(
        centerTitle: true,
        title: Text('Home Page'),
        backgroundColor: Colors.indigoAccent,
      ),
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
                 image: NetworkImage('https://t3.ftcdn.net/jpg/00/35/84/88/160_F_35848809_NDtD2U8xbxDL1TW4e2qWR1HX0ZIi12aF.jpg'),
                  width: 300,
                  height: 100,
             ),
            ],
          ),
          ),
          ElevatedButton(onPressed: () {},
              child: Text('JOIN A COMMUNITY'),
          ),
          ElevatedButton(onPressed: () {},
              child: Text('RECYCLE PLASTIC'),
          ),
          ElevatedButton(onPressed: () {},
          child: Text('EDUCATIONAL RESOURCES'),
          ),


        ],
      ),
    );
  }
}
