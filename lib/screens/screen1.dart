import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_apiii/controller/product_controller.dart';
import 'package:product_apiii/model/product_model.dart';
import 'package:product_apiii/screens/screen2.dart';


class Producthome extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
      ),
      body: SizedBox(
        child: Obx((){
          if(productController.isLoading.value){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return ListView.builder(itemCount: productController.productList.length,
                itemBuilder:  (context,index){
              final product =productController.productList[index];
                  return ListTile(
                    leading: Image.network(product.image ?? '',width: 50,height: 50,),
                    title: Text(product.title ?? ''),
                    subtitle: Text('\${product.price?'),
                    onTap: ()=>Get.to(ProductDetails(product)),
                      );
                });
          }
        }),
      ),
    );
  }
}
