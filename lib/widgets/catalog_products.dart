import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/cart_controller.dart';
import 'package:shopping_cart/controllers/product_controller.dart';
import 'package:shopping_cart/screens/cart_screen.dart';

class CatalogProducts extends StatelessWidget {
  CatalogProducts({Key? key}) : super(key: key);

  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
            itemCount: productController.products.length,
            itemBuilder: (context, index) {
              return CatalogProductCard(
                index: index,
              );
            }),
      ),
    );
  }
}

class CatalogProductCard extends StatelessWidget {
  CatalogProductCard({Key? key, required this.index}) : super(key: key);

  final cartController = Get.put(CartController());
  final int index;
  final ProductController productController = Get.find();

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
              productController.products[index].imageUrl,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 2,
            child: Text(
              productController.products[index].name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '\$${productController.products[index].price}',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              cartController.addProduct(productController.products[index]);
              Get.snackbar(
                'Product Added',
                'You have added the ${productController.products[index].name} to your cart!',
                messageText: Text(
                  'You have added the ${productController.products[index].name} to your cart!',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                snackPosition: SnackPosition.TOP,
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.white,
                onTap: (_) {
                  Get.to(
                    () => const CartScreen(),
                    transition: Transition.cupertino,
                  );
                },
              );
            },
            icon: const Icon(Icons.add_circle_rounded),
          ),
        ],
      ),
    );
  }
}
