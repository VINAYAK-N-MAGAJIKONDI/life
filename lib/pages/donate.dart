import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class donate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fund a Solution'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("fund").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No donation data found'));
          } else {
            List<DonationCard> products = snapshot.data!.docs.map((doc) {
              Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
              print(data);
              return DonationCard(
                imageUrl: data['imageurl'],
                description: data['dec'],
                label: data['label'],
                buttonText: data['type'],
              );
            }).toList();

            return ListView(
              children: products,
            );
          }
        },
      ),
    );
  }
}

class DonationCard extends StatelessWidget {
  final String imageUrl;
  final String label;
  final String description;
  final String buttonText;

  DonationCard({
    required this.imageUrl,
    required this.label,
    required this.description,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: 200.0, // Adjust height as needed
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle donation or fund button press
              },
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}
