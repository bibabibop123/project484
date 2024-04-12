import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChanged;
  MyBottomNavBar({super.key, this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return GNav(
      gap: 8,
      activeColor: Colors.white,
      iconSize: 24,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      duration: const Duration(milliseconds: 200),
      tabBackgroundColor: Colors.blueAccent,
      backgroundColor: Colors.white,
      color: Colors.blueAccent,
      onTabChange: (value) => onTabChanged!(value),
      tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Shop',
        ),
        GButton(
          icon: Icons.search,
          text: 'Search',
        ),
        GButton(
          icon: Icons.shopping_cart,
          text: 'Cart',
        ),
        GButton(
          icon: Icons.person,
          text: 'Profile',
        ),
      ],
    );
  }
}
