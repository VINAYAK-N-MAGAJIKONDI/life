import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CleanupLocation {
  final String name;
  final String date;
  final String time;
  final String description;
  final String mapUrl;
  final String imageUrl;
  final String organizer;
  final String contact;

  CleanupLocation({
    required this.name,
    required this.date,
    required this.time,
    required this.description,
    required this.mapUrl,
    required this.imageUrl,
    required this.organizer,
    required this.contact,
  });
}

class CleanupLocationsScreen extends StatefulWidget {
  @override
  State<CleanupLocationsScreen> createState() => _CleanupLocationsScreenState();
}

class _CleanupLocationsScreenState extends State<CleanupLocationsScreen> {
  late User? _user; // Declare user variable
  late List<CleanupLocation> _locations;
  late List<CleanupLocation> _filteredLocations;
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the _user variable with the current user
    _initializeUser();
    _locations = [];
    _filteredLocations = [];
    _fetchLocations();
  }

  void _initializeUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;

    if (currentUser != null) {
      setState(() {
        _user = currentUser;
      });
    }
  }

  void _fetchLocations() async {
    QuerySnapshot locationsSnapshot =
    await FirebaseFirestore.instance.collection("locations").get();

    List<CleanupLocation> fetchedLocations = locationsSnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return CleanupLocation(
        imageUrl: data['imgurl'],
        description: data['description'],
        name: data['name'],
        date: data['date'],
        time: data['time'],
        organizer: data['organizer'],
        contact: data['contact'],
        mapUrl: data['mapurl'],
      );
    }).toList();

    setState(() {
      _locations = fetchedLocations;
      _filteredLocations = fetchedLocations;
    });
  }

  void _searchLocations(String query) {
    setState(() {
      _filteredLocations = _locations
          .where((location) =>
          location.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchController.clear();
        _searchLocations('');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search locations...',
            hintStyle: TextStyle(color: Colors.white),
          ),
          style: TextStyle(color: Colors.black),
          onChanged: _searchLocations,
        )
            : Text('Cleanup Locations'),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: _toggleSearch,
          ),
        ],
      ),
      body: _buildLocationsList(_filteredLocations),
    );
  }

  Widget _buildLocationsList(List<CleanupLocation> locations) {
    if (locations.isEmpty) {
      return Center(
        child: Text('No cleanup locations found'),
      );
    } else {
      return ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return _buildCleanupLocationCard(context, locations[index]);
        },
      );
    }
  }

  Widget _buildCleanupLocationCard(BuildContext context, CleanupLocation location) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 150, // Width of the image
              height: 150, // Height of the image
              child: Image.network(
                location.imageUrl,
                fit: BoxFit.cover, // Fill the entire space
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    Text(
                      "${location.description}\nDate: ${location.date} Time: ${location.time}\nOrganizer: ${location.organizer} \nContact: ${location.contact} ",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.person_add),
                          onPressed: () {
                            if (_user != null) {
                              _registerEvent(context, location);
                            } else {
                              // User is not signed in
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('You need to sign in to register for the event.'),
                                ),
                              );
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.directions),
                          onPressed: () => _launchMap(context, location),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _registerEvent(BuildContext context, CleanupLocation location) {
    String userEmail = _user!.email ?? "UserEmail@gmail.com";
    String username = _user!.displayName ?? "User Name";

    // Send registration data to Firebase
    FirebaseFirestore.instance.collection("registrations").add({
      'username': username,
      'email': userEmail,
      'event_title': location.name,
    }).then((value) {
      // If the registration is successful, show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registered successfully!'),
        ),
      );
    }).catchError((error) {
      // If there's an error, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to register: $error'),
          backgroundColor: Colors.red,
        ),
      );
    });
  }

  Future<void> _launchMap(BuildContext context, CleanupLocation location) async {
    String mapUrl = location.mapUrl;

    if (await canLaunchUrlString(mapUrl)) {
      await launchUrlString(mapUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not open the Maps app'),
        ),
      );
    }
  }
}
