import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/product_tile.dart';
import '../models/cart.dart';
import '../models/product.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add products to cart
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
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: <Widget>[
          //hot picks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Hot Picks 🔥',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),

          //hot picks list
          Expanded(
            child: ListView.builder(
                itemCount: value.getProducts().length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  //get product from provider
                  Product product = value.getProducts()[index];
                  //return product tile
                  return ProductTile(
                    product: product,
                    onTap: () {
                      addProductToCart(product);
                    },
                  );
                }),
          ),

          // const Padding(
          //   padding: EdgeInsets.only(bottom: 25.0, top: 25.0, left: 25.0),
          //   child: Divider(
          //     color: Colors.white,
          //   ),
          // ),
        ],
      ),
    );
  }
}
