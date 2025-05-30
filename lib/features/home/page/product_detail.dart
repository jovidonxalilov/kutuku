import 'package:flutter/material.dart';
import 'package:kutuku/core/data/model/product_model.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details product'),
        actions: const [
          Icon(Icons.shopping_cart_outlined),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
        Column(
        children: [
        Image.network(
          product.image,
          width: double.infinity,
          height: 300,
          // fit: BoxFit.cover,
        ),
        SizedBox(height: 10),
        Text(product.category,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        SizedBox(height: 5),
        Text(product.price.toString(),
            style: TextStyle(color: Colors.grey)),
        SizedBox(height: 10),
        Text('Choose the color'),
        SizedBox(height: 10),
        Row(
          children: List.generate(
            5,
                (index) => Container(
              margin: EdgeInsets.only(right: 8),
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.primaries[index],
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            CircleAvatar(child: Icon(Icons.store)),
            SizedBox(width: 10),
            Expanded(child: Text('Apple Store\nonline 12 mins ago')),
            ElevatedButton(
              onPressed: () {},
              child: Text('Follow'),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(product.title,
            style: TextStyle(fontWeight: FontWeight.w600)),
        SizedBox(height: 10),
        Text(
          product.description,
        ),
        ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Add to Cart'),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                side: BorderSide(color: Colors.grey),
              ),
              child: Text('Buy Now', style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
