import 'package:get/get.dart';

import '../models/products_model.dart';

class CartController extends GetxController {
  // Add a dict to store the products in the cart.
  var _products = {}.obs;

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
      duration: const Duration(seconds: 2),
    );
  }

  get products => _products;
}
