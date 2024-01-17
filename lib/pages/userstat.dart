import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        // Remove the IconButton below to remove the logout button
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.logout),
        //     onPressed: () {
        //       // Logout logic here
        //     },
        //   ),
        // ],
      ),
      body: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My Stats'),
            subtitle: Text('Wallet cash: 100rs\nNumber of coupons: 2'),
          ),
          Expanded(
            child: Center(

              child: PieChart(
                dataMap: const {
                  'Cleanups': 40,
                  'Recycle': 30,
                  'Donation': 30,
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

          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CouponCard(
                discount: '10% off',
                // Other properties here
              ),
              CouponCard(
                discount: '30% off',
                // Other properties here
              ),
            ],
          ),
        ],

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
        color: Colors.brown.shade50, // Background color
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

class RewardSection extends StatelessWidget {
  const RewardSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Reward> rewards = [
      Reward('Trends', 10),
      Reward('Zomato', 20),
      Reward('Lenskart', 15),
      Reward('Amazon', 25),
      Reward('Starbucks', 15),
      Reward('Nike', 30),
    ];

    return Column(
      children: [
        const Text('Rewards', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
        Column(
          children: rewards.map((reward) => RewardItem(reward)).toList(),
        ),
      ],

    );
  }
}
