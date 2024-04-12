import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/product.dart';

class ProductDetailBottomAppBar extends StatefulWidget {
  Product product;
  ProductDetailBottomAppBar({super.key, required this.product});

  @override
  _ProductDetailBottomAppBarState createState() =>
      _ProductDetailBottomAppBarState();
}

class _ProductDetailBottomAppBarState extends State<ProductDetailBottomAppBar> {
  bool _isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  void addProductToCart(Product product) {
    //get cart from provider
    Provider.of<Cart>(context, listen: false).addToCart(product);
    //alert user, product added to cart
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.title} added to cart'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              addProductToCart(widget.product);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minimumSize: const Size(300, 50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.add_shopping_cart,
                  size: 22,
                ),
                SizedBox(width: 8), //8px
                Text('Add To Cart', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
    );
  }
}
