import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/catalog_products.dart';
import 'cart_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Catalog'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CatalogProducts(),
            ElevatedButton(
              onPressed: () => Get.to(() => CartScreen()),
              child: const Text('Go to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
