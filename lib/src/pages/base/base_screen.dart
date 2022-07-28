import 'package:ancora_artes/src/config/custom_colors.dart';
import 'package:ancora_artes/src/pages/cart/cart_tab.dart';
import 'package:ancora_artes/src/pages/home/home_tab.dart';
import 'package:ancora_artes/src/pages/orders/orders_tab.dart';
import 'package:ancora_artes/src/pages/profile/profile_tab.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customBlueDark,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          HomeTab(),
          CartTab(),
          OrdersTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            // pageController.jumpToPage(index);
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeIn,
            );
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: CustomColors.customBlueMedium,
        selectedItemColor: CustomColors.customBlueLight,
        unselectedItemColor: CustomColors.customBlueDark,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
