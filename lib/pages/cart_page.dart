import 'package:flutter/material.dart';
import 'package:myproject_app/models/product.dart';
import '../components/cart_item.dart';
import '../models/cart.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 219, 219),
      body: Consumer<Cart>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Cart',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20.0),

              // cart items
              (value.getCart().isEmpty)
                  ? const Center(
                      child: Text(
                        'Your cart is empty',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: value.getCart().length,
                        itemBuilder: (context, index) {
                          // get individual product
                          Product individualProduct = value.getCart()[index];

                          //check if product is in cart
                          if (value.getCart().contains(individualProduct)) {
                            // get quantity of product
                            int quantityCart = value
                                .getCart()
                                .where((element) =>
                                    element.id == individualProduct.id)
                                .length;

                            // update quantity
                          }
                          // return CartItem
                          return CartItem(
                            product: individualProduct,
                          );
                        },
                      ),
                    ),

              // total price
              (value.getCart().isEmpty)
                  ? const SizedBox.shrink()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${value.getTotalPrice()}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),

              const SizedBox(height: 20.0),

              // checkout button
              (value.getCart().isNotEmpty)
                  ? SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                        ),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),

              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
