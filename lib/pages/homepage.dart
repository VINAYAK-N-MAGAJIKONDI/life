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
          ElevatedButton(onPressed:() { },
              child: Text('PROFILE'),
          ),
          ElevatedButton(onPressed: () {},
              child: Text('MARKETPLACE'),
          ),
          ElevatedButton(onPressed: () {},
              child: Text('RECYCLE LOCATIONS'),
          ),
          ElevatedButton(onPressed: () {},
          child: Text('EDUCATIONAL RESOURCES'),
          ),


        ],
      ),
    );
  }
}
