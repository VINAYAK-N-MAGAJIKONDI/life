import 'package:flutter/cupertino.dart';
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
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100)
                )
              ),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
              children: [
                itemDashboard('Videos', CupertinoIcons.play_rectangle, Colors.deepOrange)

              ],),
            ),
          )
        ],
      )
    );
  }
  itemDashboard(String title, IconData iconData, Color background) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(00, 5),
            color: Theme.of(context).primaryColor.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 5
          )
        ]
  ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: background,
            shape: BoxShape.circle
          ),
          child: Icon(iconData, color: Colors.white),
        ),
        const SizedBox( height: 8),
        Text(title, style: Theme.of(context).textTheme.titleMedium,)
      ],
    ),
  );
}
