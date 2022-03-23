import 'package:get/get.dart';

import '../models/products_model.dart';

class CartController extends GetxController {
  // Add a dict to store the products in the cart.
  final _products = {}.obs;

  addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
    Get.snackbar(
      'Product Added',
      'You have added the ${product.name} to your cart!',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
    );
  }

  get products => _products;

  removeProduct(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  //get total price of each product
  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  //get the total of all products
  get total => productSubtotal
      .fold(0, (previousProduct, nextProduct) => previousProduct + nextProduct)
      .toStringAsFixed(2);
}
