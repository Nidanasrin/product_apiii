import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:product_apiii/model/product_model.dart';

class ProductDetails extends StatelessWidget {
  final Products product;
  ProductDetails(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title ?? "Product Details"),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.all(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image
                Center(
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: product.image!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Title
                Text(
                  product.title ?? "",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
                SizedBox(height: 10),

                // Price
                Text(
                  "\$${product.price?.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
                SizedBox(height: 10),

                // Category
                Text(
                  "Category: ${product.category}",
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 10),

                // Description
                Text(
                  product.description ?? "",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),

                // Rating
                if (product.rating != null)
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange),
                      SizedBox(width: 5),
                      Text(
                        "${product.rating!.rate} (${product.rating!.count} reviews)",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}