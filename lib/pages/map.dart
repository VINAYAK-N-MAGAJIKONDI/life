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

  @override
  void initState() {
    super.initState();
    // Initialize the _user variable with the current user
    _initializeUser();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cleanup Locations"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("locations").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No cleanup locations found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot<Object?> doc = snapshot.data!.docs[index];
                Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

                return _buildCleanupLocationCard(
                  context,
                  CleanupLocation(
                    imageUrl: data['imgurl'],
                    description: data['description'],
                    name: data['name'],
                    date: data['date'],
                    time: data['time'],
                    organizer: data['organizer'],
                    contact: data['contact'],
                    mapUrl: data['mapurl'],
                  ),
                );
              },
            );
          }
        },
      ),
    );
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
