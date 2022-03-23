import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Your Product Cart'),
        ),
        body: Column(
          children: [
            CartProducts(),
            CartTotal(),
          ],
        ));
  }
}
