import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart.dart';
import '../models/product.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //update search list
  void updateSearchList(String value) {
    Provider.of<Cart>(context, listen: false).updateSearchList(value);
  }

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
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        updateSearchList(value);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 30,
                  ),
                ],
              ),
            ),
            //message
            (value.getSearchList().isEmpty)
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 25.0),
                      child: Text(
                        'No results found',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(height: 20),

            //create a list of products
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                itemCount: value.getSearchList().length,
                itemBuilder: (context, index) {
                  Product product = value.getSearchList()[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ListTile(
                      leading: Image.asset(product.imageUrl),
                      title: Text(product.title),
                      subtitle: Text(product.price.toString()),
                      trailing: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          addProductToCart(product);
                        },
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
