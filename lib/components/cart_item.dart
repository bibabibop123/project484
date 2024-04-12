import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/product.dart';

class CartItem extends StatefulWidget {
  Product product;
  CartItem({
    super.key,
    required this.product,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  //remove item from cart
  void removeItemFromCart() {
    setState(() {
      // Provider.of<Cart>(context, listen: false).removeFromCart(widget.product);

      if (Provider.of<Cart>(context, listen: false)
          .getCart()
          .contains(widget.product)) {
        Provider.of<Cart>(context, listen: false)
            .removeFromCart(widget.product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        leading: Image.asset(widget.product.imageUrl),
        title: Text(widget.product.title),
        subtitle: Text(widget.product.price.toString()),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}
