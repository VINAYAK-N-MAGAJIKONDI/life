import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Reward {
  final String brand;
  final int discount;

  Reward(this.brand, this.discount);
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
        color: Colors.brown.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                reward.brand,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Text(
                '${reward.discount}% off',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
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
            return Reward(data['brand'], data['discount']);
          }).toList();

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