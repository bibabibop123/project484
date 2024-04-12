import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart.dart';
import 'models/product.dart';
import 'pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Product(
            id: '',
            title: '',
            description: '',
            brand: '',
            imageUrl: '',
            price: 0,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
          builder: (context, child) => MaterialApp(
            title: 'Flutter Shopping',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: const IntroPage(),
          ),
        ),
      ],
    );
  }
}
