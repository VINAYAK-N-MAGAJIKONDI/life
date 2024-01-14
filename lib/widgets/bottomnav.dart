import 'package:flutter/material.dart';
import 'userinfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../pages/chat.dart';
import '../pages/marketplace.dart';
import '../pages/homepage.dart';

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const NavigationExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  User? _user;

  @override
  void initState() {
    super.initState();
    // Initialize the _user variable with the current user
    _initializeUser();
  }

  void _initializeUser() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      setState(() {
        _user = currentUser;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.account_circle_outlined),
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),

            label: 'Shop',
          ),
          NavigationDestination(
            icon: Icon(Icons.chat),
            label: 'Ai Chat',
          ),
        ],
      ),
      body: _buildCurrentPage(),
    );
  }

  Widget _buildCurrentPage() {
    switch (currentPageIndex) {
      case 0:
        return UserInfoWidget(user: _user);
      case 1:
        return homepage();
      case 2:
        return marketplace();
      case 3:
        return Ai();
      default:
        return Container(); // Handle other cases if needed
    }
  }





}

