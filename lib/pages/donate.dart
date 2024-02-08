import 'package:flutter/material.dart';

class donate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fund a Solution'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DonationCard(
              imageUrl: 'https://images.unsplash.com/photo-1606136025851-3c3d10b29137?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YXF1YXRpYyUyMGxpZmV8ZW58MHx8MHx8fDA%3D', // Replace with your image URL
              label: 'NGO Project:\nBlue Harmony: Safeguarding Aquatic Ecosystems',
              description: 'Blue Harmony" aims to address the threats faced by aquatic ecosystems, promote sustainable practices, and raise awareness about the importance of preserving marine life. The project focuses on community engagement, scientific research, and educational outreach to foster a sense of responsibility towards aquatic environments.',
              buttonText: 'Donate',
            ),
            DonationCard(
              imageUrl: 'https://media.istockphoto.com/id/1183347762/photo/environmental-conservation-collecting-garbage-and-trash-from-water.webp?b=1&s=170667a&w=0&k=20&c=ux10A_qxz1lOsMVYHa9wTDT0bY38LnlJ6u7ofkUl_w4=', // Replace with your image URL
              label: 'NGO project:\nCleanFlow: The Clean Water Charity',
              description: 'CleanFlow focuses on implementing sustainable water solutions, raising awareness about water-related issues, and fostering community empowerment through education and capacity-building.',
              buttonText: 'Donate',
            ),
            DonationCard(
              imageUrl: 'https://images.unsplash.com/photo-1507582020474-9a35b7d455d9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjAwfHxhcXVhdGljJTIwZHJvbmVzfGVufDB8fDB8fHww', // Replace with your image URL
              label: 'Student Project:\nAquatic Drone for Trash Collection',
              description: 'Build a drone capable of collecting floating debris and trash from water bodies and sensors to navigate and identify areas with high pollution levels. This project helps in cleaning up aquatic environments efficiently.',
              buttonText: 'Fund',
            ),
            DonationCard(
              imageUrl: 'https://images.unsplash.com/photo-1636906513757-6721f8eb7cbd?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjJ8fHNoZWxsJTIwYXJ0fGVufDB8fDB8fHww', // Replace with your image URL
              label: 'Student Project:\nOcean Art Installation from Recycled Materials',
              description: 'A collaborative art project using recycled materials collected from beaches and coastal areas. The art installation can raise awareness about ocean pollution and the importance of responsible waste disposal.',
              buttonText: 'Fund',
            ),
            DonationCard(
              imageUrl: 'https://images.unsplash.com/photo-1584265902195-006ce01d8717?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTg5fHxDaXRpemVuJTIwU2NpZW5jZSUyMENvcmFsJTIwQmxlYWNoaW5nJTIwTW9uaXRvcmluZ3xlbnwwfHwwfHx8MA%3D%3D', // Replace with your image URL
              label: 'Student Project:\nCitizen Science Coral Bleaching Monitoring',
              description: 'Engaging students in citizen science initiatives by providing training on how to identify coral bleaching symptoms and use underwater photography techniques to document affected coral reefs. Students can contribute valuable data to scientists studying the impacts of climate change on coral ecosystems.',
              buttonText: 'Fund',
            ),
          ],
        ),
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

void main() {
  runApp(MaterialApp(
    home: donate(),
  ));
}
