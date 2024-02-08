import 'package:flutter/material.dart';

const Color darkBlue = Color(0xFF040B14);
const Color starColor = Color(0xFFFFFFFF);

PreferredSizeWidget? customAppBar() {
  return AppBar(
    backgroundColor: darkBlue,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.stars, color: starColor),
        SizedBox(width: 8),
        Text("Ask Gemini", style: TextStyle(color: starColor)),
        SizedBox(width: 8),
        Icon(Icons.stars, color: starColor),
      ],
    ),
    centerTitle: true,
    elevation: 0, // Remove the shadow
  );
}
