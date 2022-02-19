import 'package:dot_furniture/screens/cart_page.dart';
import 'package:dot_furniture/screens/profile_page.dart';
import 'package:dot_furniture/screens/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'store_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pageList = const [
    StorePage(),
    CartPage(),
    WishListPage(),
    ProfilePage()
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        // selectedFontSize: 20,
        selectedLabelStyle: GoogleFonts.shizuru(),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
    );
  }
}
