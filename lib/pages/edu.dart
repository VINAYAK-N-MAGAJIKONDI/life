import 'package:flutter/material.dart';
class edu extends StatefulWidget {
  const edu({super.key});

  @override
  State<edu> createState() => _eduState();
}

class _eduState extends State<edu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EDUCATIONAL RESOURCES'),

      ),
    );
  }
}
