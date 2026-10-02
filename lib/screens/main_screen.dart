import 'package:flowee_app/screens/favorite_screen.dart';
import 'package:flowee_app/screens/home_screen.dart';
import 'package:flowee_app/widgets/bottom_nav_item.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

/**
 * SHELL adalah metode untuk menampung 2 atau lebih screen pada aplikasi agar dapat bernavigasi melalui index,
 * dan tidak bernavigasi melalui navigator
 */
class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // dibungkus menjadi 1 variabel karna pakenya index, sedangkan index punya tipe data list
  static const _screens = [
    HomeScreen(),
    FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /**
       * extendBody: true -> akan membuat 'body' bisa terscroll SAMPAI KE BELAKANG
       * navbar bawah yang floating
       */
      extendBody: true,
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 110, right: 110, bottom: 16),
          child: Container(
            height: 76,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              // Shadow container navbar
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomNavItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  selected: _selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                ),
                BottomNavItem(
                  icon: Icons.shopping_bag_rounded,
                  label: 'Favorite',
                  selected: _selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
