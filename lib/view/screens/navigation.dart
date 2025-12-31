import 'package:arcadein_cafe/view/screens/cart/cart.dart';
import 'package:arcadein_cafe/view/screens/home_screen/home_screen.dart';
import 'package:arcadein_cafe/view/screens/menu_screen/menu_screen.dart';
import 'package:arcadein_cafe/view/screens/profile/profile.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  List<Widget> screens = [
    HomeScreen(),
    MenuScreen(),
    Cart(),
    Profile(),
  ];
   int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: AppColors.darkBrown.withValues(alpha: 0.1),
          highlightColor: Colors.transparent
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index){
            setState(() {
              selectedIndex = index;
            });
          },
          backgroundColor: AppColors.creamBackground,
          selectedIconTheme: IconThemeData(size: 28, color: AppColors.darkBrown),
          unselectedIconTheme: IconThemeData(size: 24, color: AppColors.mediumBrown),
          selectedItemColor: AppColors.darkBrown,
          unselectedItemColor: AppColors.mediumBrown,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 8, // subtle shadow
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
