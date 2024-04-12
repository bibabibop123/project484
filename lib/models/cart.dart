import 'product.dart';
import 'package:flutter/foundation.dart';

class Cart extends ChangeNotifier {
  //list of products for sale
  List<Product> productShop = [
    Product(
      id: '1',
      title: 'Bitis Hunter 01',
      brand: 'Bitis',
      description:
          "A sneaker, also known as a trainer or athletic shoe, is a type of footwear primarily designed for sports or other physical activities. Sneakers typically have a flexible sole made of rubber or synthetic material, and an upper part made of leather, synthetic materials, or a combination of both. Sneakers have a long and interesting history, dating back to the late 1800s when the first rubber-soled shoes were created. In the early 1900s, companies such as Keds and Converse began producing canvas sneakers for athletes. Over the years, sneakers have become more than just functional footwear for sports. They have become a fashion statement and a cultural symbol, with many brands and styles being highly sought after by sneaker enthusiasts. Some of the most popular sneaker brands include Nike, Adidas, Puma, Reebok, and Vans. Each brand has its own unique designs and technology, with many releasing limited edition or collaboration sneakers that can fetch high prices on the resale market. Sneaker culture has also given rise to sneakerhead communities and events, where enthusiasts come together to buy, sell, trade, and showcase their collections. There are also websites and apps dedicated to sneaker releases, news, and information. Overall, sneakers have become a beloved part of modern culture, with their functional design and stylish appeal making them a staple in many people's wardrobes.",
      price: 120,
      imageUrl: 'assets/images/sneaker_bitis_01.jpg',
    ),
    Product(
      id: '2',
      title: 'Bitis Hunter 02',
      brand: 'Bitis',
      description:
          "A sneaker, also known as a trainer or athletic shoe, is a type of footwear primarily designed for sports or other physical activities. Sneakers typically have a flexible sole made of rubber or synthetic material, and an upper part made of leather, synthetic materials, or a combination of both. Sneakers have a long and interesting history, dating back to the late 1800s when the first rubber-soled shoes were created. In the early 1900s, companies such as Keds and Converse began producing canvas sneakers for athletes. Over the years, sneakers have become more than just functional footwear for sports. They have become a fashion statement and a cultural symbol, with many brands and styles being highly sought after by sneaker enthusiasts. Some of the most popular sneaker brands include Nike, Adidas, Puma, Reebok, and Vans. Each brand has its own unique designs and technology, with many releasing limited edition or collaboration sneakers that can fetch high prices on the resale market. Sneaker culture has also given rise to sneakerhead communities and events, where enthusiasts come together to buy, sell, trade, and showcase their collections. There are also websites and apps dedicated to sneaker releases, news, and information. Overall, sneakers have become a beloved part of modern culture, with their functional design and stylish appeal making them a staple in many people's wardrobes.",
      price: 140,
      imageUrl: 'assets/images/sneaker_bitis_02.jpg',
    ),
    Product(
      id: '3',
      title: 'Bitis Hunter 03',
      brand: 'Bitis',
      description:
          "A sneaker, also known as a trainer or athletic shoe, is a type of footwear primarily designed for sports or other physical activities. Sneakers typically have a flexible sole made of rubber or synthetic material, and an upper part made of leather, synthetic materials, or a combination of both. Sneakers have a long and interesting history, dating back to the late 1800s when the first rubber-soled shoes were created. In the early 1900s, companies such as Keds and Converse began producing canvas sneakers for athletes. Over the years, sneakers have become more than just functional footwear for sports. They have become a fashion statement and a cultural symbol, with many brands and styles being highly sought after by sneaker enthusiasts. Some of the most popular sneaker brands include Nike, Adidas, Puma, Reebok, and Vans. Each brand has its own unique designs and technology, with many releasing limited edition or collaboration sneakers that can fetch high prices on the resale market. Sneaker culture has also given rise to sneakerhead communities and events, where enthusiasts come together to buy, sell, trade, and showcase their collections. There are also websites and apps dedicated to sneaker releases, news, and information. Overall, sneakers have become a beloved part of modern culture, with their functional design and stylish appeal making them a staple in many people's wardrobes.",
      price: 160,
      imageUrl: 'assets/images/sneaker_bitis_03.jpg',
    ),
    Product(
      id: '4',
      title: 'Bitis Hunter 04',
      brand: 'Bitis',
      description:
          "A sneaker, also known as a trainer or athletic shoe, is a type of footwear primarily designed for sports or other physical activities. Sneakers typically have a flexible sole made of rubber or synthetic material, and an upper part made of leather, synthetic materials, or a combination of both. Sneakers have a long and interesting history, dating back to the late 1800s when the first rubber-soled shoes were created. In the early 1900s, companies such as Keds and Converse began producing canvas sneakers for athletes. Over the years, sneakers have become more than just functional footwear for sports. They have become a fashion statement and a cultural symbol, with many brands and styles being highly sought after by sneaker enthusiasts. Some of the most popular sneaker brands include Nike, Adidas, Puma, Reebok, and Vans. Each brand has its own unique designs and technology, with many releasing limited edition or collaboration sneakers that can fetch high prices on the resale market. Sneaker culture has also given rise to sneakerhead communities and events, where enthusiasts come together to buy, sell, trade, and showcase their collections. There are also websites and apps dedicated to sneaker releases, news, and information. Overall, sneakers have become a beloved part of modern culture, with their functional design and stylish appeal making them a staple in many people's wardrobes.",
      price: 180,
      imageUrl: 'assets/images/sneaker_bitis_04.jpg',
    ),
  ];

  //search list
  List<Product> searchList = [];

  //get search list
  List<Product> getSearchList() {
    return searchList;
  }

  //set search list
  void setSearchList(List<Product> list) {
    searchList = list;
    notifyListeners();
  }

  //update search list
  void updateSearchList(String query) {
    searchList = productShop
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }

  //list of items user cart
  List<Product> userCart = [];
  //get list of products for sale
  List<Product> getProducts() {
    return productShop;
  }

  //get cart
  List<Product> getCart() {
    return userCart;
  }

  //get total price of cart
  double getTotalPrice() {
    double totalPrice = 0;
    for (var i = 0; i < userCart.length; i++) {
      totalPrice += userCart[i].price;
    }
    return totalPrice;
  }

  //set favorite
  void setFavorite(Product product) {
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }

  //add items to cart
  void addToCart(Product product) {
    userCart.add(product);
    notifyListeners();
  }

  //remove items from cart
  void removeFromCart(Product product) {
    userCart.remove(product);
    notifyListeners();
  }
}
