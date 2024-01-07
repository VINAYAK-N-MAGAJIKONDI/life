import 'package:flutter/material.dart';
import '../widgets/bottomnav.dart';

class base extends StatefulWidget {
  const base({Key? key}) : super(key: key);

  @override
  State<base> createState() => _baseState();
}

class _baseState extends State<base> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("base of app"),),
      body: NavigationBarApp(),



    );
  }
}
