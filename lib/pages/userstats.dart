import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pie_chart/pie_chart.dart';

import '../widgets/rewards.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatelessWidget {

  final User? user;
  final String? userid;

  ProfilePage({Key? key})
      : user = FirebaseAuth.instance.currentUser,
        userid = FirebaseAuth.instance.currentUser?.uid,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("users").where("uid", isEqualTo: userid).snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No user data found'));
            } else {
              Map<String, dynamic> userMap = snapshot.data!.docs.first.data() as Map<String, dynamic>;
              print(userMap);
              // Print user data for debugging
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CouponCard(
                          discount: 'Wallet Points = ${userMap["cash"]}',
                        ),

                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: PieChart(
                        dataMap: {
                          'Cleanups': ((userMap["cleanups"] ?? 0) + (userMap["recycle"] ?? 0) + (userMap["donation"] ?? 0)) > 0 ? (100 * (userMap["cleanups"] ?? 0) / ((userMap["cleanups"] ?? 0) + (userMap["recycle"] ?? 0) + (userMap["donation"] ?? 0))).toDouble() : 0,
                          'Recycle': ((userMap["cleanups"] ?? 0) + (userMap["recycle"] ?? 0) + (userMap["donation"] ?? 0)) > 0 ? (100 * (userMap["recycle"] ?? 0) / ((userMap["cleanups"] ?? 0) + (userMap["recycle"] ?? 0) + (userMap["donation"] ?? 0))).toDouble() : 0,
                          'Donation': ((userMap["cleanups"] ?? 0) + (userMap["recycle"] ?? 0) + (userMap["donation"] ?? 0)) > 0 ? (100 * (userMap["donation"] ?? 0) / ((userMap["cleanups"] ?? 0) + (userMap["recycle"] ?? 0) + (userMap["donation"] ?? 0))).toDouble() : 0,
                        },
                        chartLegendSpacing: 32,
                        chartRadius: MediaQuery.of(context).size.width / 3.2,
                        colorList: const [
                          Colors.yellow,
                          Colors.green,
                          Colors.blue,
                        ],
                        initialAngleInDegree: 0,
                        chartType: ChartType.disc,
                      ),
                    ),
                    SizedBox(height: 20),
                    RewardSections(),
                  ],
                ),
              );
            }
          },
        ),
      );
  }
}


class CouponCard extends StatelessWidget {
  final String discount;

  const CouponCard({Key? key, required this.discount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(discount),
      ),
    );
  }
}
