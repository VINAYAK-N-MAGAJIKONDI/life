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
  // Other properties here

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
