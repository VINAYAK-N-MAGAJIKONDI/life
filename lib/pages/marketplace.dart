import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:life/widgets/rewards.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({Key? key}) : super(key: key);

  @override
  MarketplacePageState createState() => MarketplacePageState();
}

class MarketplacePageState extends State<MarketplacePage> {
  // List<Product> products = [
  //   Product(
  //     id: 1,
  //     name: 'Reusable Water Bottles',
  //     description: 'Stay hydrated with our eco-friendly water bottles.',
  //     price: 60.00,
  //     imageUrl: 'https://th.bing.com/th/id/OIP.BcmL4DT51HcUYSt08ioyHQHaHa?w=188&h=188&c=7&r=0&o=5&dpr=1.3&pid=1.7',
  //     seller:Seller(name: 'Seller A', rating: 4.5),
  //   ),
  //   Product(
  //     id: 2,
  //     name: 'Biodegradable and compostable cutlery and tableware.',
  //     description: 'Experience guilt-free dining with our Biodegradable and Compostable Cutlery and Tableware. Thoughtfully crafted for eco-friendly gatherings, these utensils and tableware effortlessly blend convenience with sustainability, leaving a positive impact on the planet.',
  //     price: 200.00,
  //     imageUrl: 'https://i2.wp.com/bioplasticsnews.com/wp-content/uploads/2019/10/biodegradable-tableware.jpg?resize=1316%2C625&ssl=1',
  //     seller: Seller(name: 'Seller B', rating: 4.8),
  //   ),
  //   Product(
  //     id: 3,
  //     name: 'Plastic Recycling Units:',
  //     description: 'Discover a greener future with our Plastic Recycling Units. Empowering communities to responsibly dispose of plastic waste, these units are the first step towards a cleaner, more sustainable environment.',
  //     price: 100.00,
  //     imageUrl: 'https://cna-sg-res.cloudinary.com/image/upload/q_auto,f_auto/image/11534438/16x9/991/557/3a615de9e8a677a72a0a63543b4dca43/YV/recycling-bin-file-2.jpg',
  //     seller: Seller(name: 'Seller C', rating: 4.6),
  //   ),
  //   Product(
  //     id: 4,
  //     name: 'Eco-Friendly plastic bags',
  //     description: 'Embrace sustainability with our Eco-Friendly Plastic Bags – a conscientious choice for eco-conscious consumers. Durable, versatile, and planet-friendly, these bags are your stylish companion on the go.',
  //     price: 75.00,
  //     imageUrl: 'https://th.bing.com/th/id/OIP.MXyoC8_tz1iUnpsIjF8jvwAAAA?w=453&h=255&rs=1&pid=ImgDetMain',
  //     seller: Seller(name: 'Seller E', rating: 4.9),
  //   ),
  //   Product(
  //     id: 5,
  //     name: 'Eco-Friendly bags',
  //     description: '"Elevate your eco-conscious lifestyle with our Eco-Friendly Bags – thoughtfully crafted from sustainable materials. Stylish, durable, and environmentally responsible, these bags redefine fashion with a commitment to a greener planet."',
  //     price: 150.00,
  //     imageUrl: 'https://www.theprintedbagshop.co.uk/wp-content/uploads/2020/04/3981712-2048x1365.jpg',
  //     seller: Seller(name: 'Seller D', rating: 4.7),
  //   ),
  //
  //
  // ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection("products").snapshots(),
        builder: (context,snapshot){
      if(snapshot.connectionState == ConnectionState.waiting){
        return CircularProgressIndicator();
      } else if (snapshot.hasError){
        return Text('Error: ${snapshot.error}');
      }else if (!snapshot.hasData || snapshot.data!.docs.isEmpty){
        return Text('No reward data found');
      }else {
        List<Product> products = snapshot.data!.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          print(data);
          return Product(id: data['id'], name: data['name'], description: data['description'], price: data['price'], imageUrl: data['url'], sellername: data['sellername'], sellerrating: data['rating']) ;
        }).toList();

        return SingleChildScrollView(
          child: Column(
            children:
              products.map((product) => ProductCard(product: product)).toList(),
          
          ),
        );
      }
        });
  }
}

// Scaffold(
// appBar: AppBar(
// title: const Text('Marketplace'),
// ),
// body: ListView(
// children: [
// // DonationSection(donationOptions: donationOptions),
// ...products.map((product) => ProductCard(product: product)),
// ],
// ),
// );

class Product {
  final int id;
  final String name;
  final String description;
  final int price;
  final String? imageUrl;
  final String? sellername;
  final String? sellerrating;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.sellername,
    required this.sellerrating,
  });
}



class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            product.imageUrl ?? "https://th.bing.com/th?id=OIP.GMfT3Iyl9sIYkBigPmGGFwHaF7&w=279&h=223&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2",
            height: 500,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Price: ${product.price.toString()}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Seller: ${product.sellername} (${product.sellerrating} rating)',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
