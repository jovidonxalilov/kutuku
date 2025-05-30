import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kutuku/core/data/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              product.image,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            product.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text("\$${product.price}", style: const TextStyle(color: Colors.green)),
          const SizedBox(height: 4),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text("Add to cart"),
            ),
          ),
        ],
      ),
    );
  }
}
