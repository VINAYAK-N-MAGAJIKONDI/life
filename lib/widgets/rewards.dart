import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Reward {
  final String brand;
  final int discount;
  final String? imageUrl;

  Reward(this.brand, this.discount , this.imageUrl);
}

class RewardItem extends StatelessWidget {
  final Reward reward;

  const RewardItem(this.reward);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(reward.imageUrl ?? "https://th.bing.com/th?id=OIP.50lV36kdwDoeGeOnoTuyJgHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2"),
            radius: 40,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reward.brand,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 8),
                Text(
                  '${reward.discount}% off',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}

class RewardSections extends StatelessWidget {
  final User? user;
  final String? userid;
  RewardSections({Key? key})       : user = FirebaseAuth.instance.currentUser,
  userid = FirebaseAuth.instance.currentUser?.uid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("rewards").where("uid", isEqualTo: userid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('No reward data found');
        } else {
          List<Reward> rewards = snapshot.data!.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return Reward(data['brand'], data['discount'] , data['url']);
          }).toList();
          print(rewards);

          return Column(
            children: [
              const Text('Rewards', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              Column(
                children: rewards.map((reward) => RewardItem(reward)).toList(),
              ),
            ],
          );
        }
      },
    );
  }
}