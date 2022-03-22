import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/cart_controller.dart';
import 'package:shopping_cart/models/products_model.dart';

class CartProducts extends StatelessWidget {
  CartProducts({Key? key}) : super(key: key);

  final CartController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: ListView.builder(
        itemCount: controller.products.length,
        itemBuilder: ((context, index) {
          return CartProductCard(
            controller: controller,
            product: controller.products.keys.toList()[index],
            quantity: controller.products.values.toList()[index],
            index: index,
          );
        }),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  CartProductCard(
      {Key? key,
      required this.controller,
      required this.index,
      required this.product,
      required this.quantity})
      : super(key: key);

  final CartController controller;
  final int index;
  final Product product;
  final int quantity;

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
              product.imageUrl,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(product.name),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.remove_circle),
          ),
          Text(quantity.toString()),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
    );
  }
}
