import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/cart_controller.dart';
import 'package:shopping_cart/models/products_model.dart';

class CatalogProducts extends StatelessWidget {
  const CatalogProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          itemCount: Product.products.length,
          itemBuilder: (context, index) {
            return CatalogProductCard(
              index: index,
            );
          }),
    );
  }
}

class CatalogProductCard extends StatelessWidget {
  CatalogProductCard({Key? key, required this.index}) : super(key: key);

  final cartController = Get.put(CartController());
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              Product.products[index].imageUrl,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              Product.products[index].name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          Expanded(
            child: Text('${Product.products[index].price}'),
          ),
          IconButton(
            onPressed: () {
              cartController.addProduct(Product.products[index]);
            },
            icon: const Icon(Icons.add_circle_rounded),
          ),
        ],
      ),
    );
  }
}
