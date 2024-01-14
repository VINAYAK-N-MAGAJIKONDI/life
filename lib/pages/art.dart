import 'package:flutter/material.dart';
class art extends StatefulWidget {
  const art({Key? key}) : super(key: key);

  @override
  State<art> createState() => _artState();
}

class _artState extends State<art> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Arts and crafts"),
      ),
    );
  }
}
