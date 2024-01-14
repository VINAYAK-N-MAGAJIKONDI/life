import 'package:flutter/material.dart';



class MarketplacePage extends StatefulWidget {
  const MarketplacePage({Key? key}) : super(key: key);

  @override
  MarketplacePageState createState() => MarketplacePageState();
}

class MarketplacePageState extends State<MarketplacePage> {
  List<Product> products = [
    Product(
      id: 1,
      name: 'Reusable Water Bottles',
      description: 'Stay hydrated with our eco-friendly water bottles.',
      price: 60.00,
      imageUrl: 'https://th.bing.com/th/id/OIP.BcmL4DT51HcUYSt08ioyHQHaHa?w=188&h=188&c=7&r=0&o=5&dpr=1.3&pid=1.7',
      seller:Seller(name: 'Seller A', rating: 4.5),
    ),
    Product(
      id: 2,
      name: 'Biodegradable and compostable cutlery and tableware.',
      description: 'Experience guilt-free dining with our Biodegradable and Compostable Cutlery and Tableware. Thoughtfully crafted for eco-friendly gatherings, these utensils and tableware effortlessly blend convenience with sustainability, leaving a positive impact on the planet.',
      price: 200.00,
      imageUrl: 'https://i2.wp.com/bioplasticsnews.com/wp-content/uploads/2019/10/biodegradable-tableware.jpg?resize=1316%2C625&ssl=1',
      seller: Seller(name: 'Seller B', rating: 4.8),
    ),
    Product(
      id: 3,
      name: 'Plastic Recycling Units:',
      description: 'Discover a greener future with our Plastic Recycling Units. Empowering communities to responsibly dispose of plastic waste, these units are the first step towards a cleaner, more sustainable environment.',
      price: 100.00,
      imageUrl: 'https://cna-sg-res.cloudinary.com/image/upload/q_auto,f_auto/image/11534438/16x9/991/557/3a615de9e8a677a72a0a63543b4dca43/YV/recycling-bin-file-2.jpg',
      seller: Seller(name: 'Seller C', rating: 4.6),
    ),
    Product(
      id: 4,
      name: 'Eco-Friendly plastic bags',
      description: 'Embrace sustainability with our Eco-Friendly Plastic Bags – a conscientious choice for eco-conscious consumers. Durable, versatile, and planet-friendly, these bags are your stylish companion on the go.',
      price: 75.00,
      imageUrl: 'https://th.bing.com/th/id/OIP.MXyoC8_tz1iUnpsIjF8jvwAAAA?w=453&h=255&rs=1&pid=ImgDetMain',
      seller: Seller(name: 'Seller E', rating: 4.9),
    ),
    Product(
      id: 5,
      name: 'Eco-Friendly bags',
      description: '"Elevate your eco-conscious lifestyle with our Eco-Friendly Bags – thoughtfully crafted from sustainable materials. Stylish, durable, and environmentally responsible, these bags redefine fashion with a commitment to a greener planet."',
      price: 150.00,
      imageUrl: 'https://www.theprintedbagshop.co.uk/wp-content/uploads/2020/04/3981712-2048x1365.jpg',
      seller: Seller(name: 'Seller D', rating: 4.7),
    ),


  ];
  List<DonationOption> donationOptions = [
    DonationOption(
      id: 1,
      name: 'Clean Water Charity',
      description: 'Supports clean water initiatives.',
    ),
    DonationOption(
      id: 2,
      name: 'Green Earth Foundation',
      description: 'Helps in planting trees for a greener planet.',
    ),
    DonationOption(
      id: 3,
      name: 'Save Aquatic life',
      description: 'Helps in protecting and preserving aquatic life.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
      ),
      body: ListView(
        children: [
          DonationSection(donationOptions: donationOptions),
          ...products.map((product) => ProductCard(product: product)),
        ],
      ),
    );
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final Seller seller;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.seller,
  });
}

class Seller {
  final String name;
  final double rating;

  Seller({required this.name, required this.rating});
}

class DonationOption {
  final int id;
  final String name;
  final String description;

  DonationOption({
    required this.id,
    required this.name,
    required this.description,
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
            product.imageUrl,
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
                  'Seller: ${product.seller.name} (${product.seller.rating} rating)',
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

class DonationSection extends StatelessWidget {
  final List<DonationOption> donationOptions;

  const DonationSection({Key? key, required this.donationOptions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 8.0),
          const Text(
            'Support a Cause',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Column(
            children: donationOptions
                .map((donationOption) => DonationOptionCard(
              donationOption: donationOption,
            ))
                .toList(),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

class DonationOptionCard extends StatelessWidget {
  final DonationOption donationOption;

  const DonationOptionCard({Key? key, required this.donationOption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          donationOption.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          donationOption.description,
          style: const TextStyle(fontSize: 16),
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Handle donation logic
          },
          child: const Text('Donate'),
        ),
      ),
    );
  }
}
