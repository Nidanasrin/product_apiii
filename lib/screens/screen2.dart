
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:product_apiii/model/product_model.dart';


class ProductDetails extends StatelessWidget {
  final Products product;
  ProductDetails(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: CachedNetworkImage(
              imageUrl: product.image!,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 10,),
          Text(product.title!,
            style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold),
            maxLines: 2,
          ),Text('${product.price!}\$',style: TextStyle(fontSize: 15),)

        ],

      ),
    );
  }
}
