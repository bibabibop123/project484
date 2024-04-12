import 'package:flutter/material.dart';
import 'package:myproject_app/pages/cart_page.dart';
import 'package:myproject_app/pages/search_page.dart';
import 'package:myproject_app/pages/shop_page.dart';
import '../components/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _children = const <Widget>[
    //shop page
    ShopPage(),
    //search page
    // Center(child: Text('Search Page')),
    SearchPage(),
    //cart page
    CartPage(),
    //profile page
    Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 219, 219, 219),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 60,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            padding: const EdgeInsets.only(left: 12.0),
            icon: const Icon(Icons.menu),
            color: Colors.black,
            iconSize: 32,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        flexibleSpace: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/logo.png',
            width: 140,
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(
        onTabChanged: (value) => navigateBottomBar(value),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: const [
              SizedBox(height: 50),
              //logo
              DrawerHeader(
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 100,
                  height: 100,
                ),
              ),
              //menu
              //home
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                ),
              ),
              //cart
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Cart'),
                ),
              ),
              //profile
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                ),
              ),
              //about
              Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: ListTile(
                  leading: Icon(Icons.info),
                  title: Text('About'),
                ),
              ),
            ]),
            //footer
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
            ),
            //
            const Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Text('© 2023 by npvinh39',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      )),
                ),
              ),
            ),
            //logout
          ],
        ),
      ),
      body: _children[_selectedIndex],
    );
  }
}
