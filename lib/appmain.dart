import 'package:flutter/material.dart';
import 'package:mobileappproject/firstpage.dart';
import 'package:mobileappproject/fourthpage.dart';
import 'package:mobileappproject/secondpage.dart';
import 'package:mobileappproject/thirdpage.dart';


class appMain extends StatefulWidget {
  const appMain({super.key});

  @override
  State<appMain> createState() => _appMainState();
}

class _appMainState extends State<appMain> {
  int _selectedIndex = 0;
  var _navBarItems = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home_rounded),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Icon(Icons.restaurant_menu_outlined),
      selectedIcon: Icon(Icons.restaurant_menu_rounded),
      label: 'Menu',
    ),
    NavigationDestination(
      icon: Icon(Icons.shopping_bag_outlined),
      selectedIcon: Icon(Icons.shopping_bag),
      label: 'Cart',
    ),
    NavigationDestination(
      icon: Icon(Icons.person_outline_rounded),
      selectedIcon: Icon(Icons.person_rounded),
      label: 'Profile',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    List name = [
      FirstPage(),
      secondpage(),
      AddToCartPage(),
      fourthpage()
    ];
    return Scaffold(
      body: name[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(seconds: 1),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: _navBarItems,
      ),
    );
  }
}
