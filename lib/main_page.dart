import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:gourmet_hub/providers/cart_provider.dart';            // ← package стиль

import 'package:gourmet_hub/features/home/view/home_page.dart';
import 'package:gourmet_hub/features/catalog/view/catalog_screen.dart';
import 'package:gourmet_hub/features/favorites/view/favorites_screen.dart';
import 'package:gourmet_hub/features/offers/view/offers_screen.dart';
import 'package:gourmet_hub/features/cart/view/cart_screen.dart';        // ← package стиль
import 'package:gourmet_hub/features/profile/view/profile_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  final screens = [
    HomePage(),
    CatalogScreen(),
    FavoritesScreen(),
    OffersScreen(),
    CartScreen(),         // ← теперь 100% найдёт
    ProfileScreen(),
  ];

  Widget _cartIconWithBadge() {
    final count = context.watch<CartProvider>().totalItems;
    return Stack(
      children: [
        const Icon(Icons.shopping_cart),
        if (count > 0)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
              child: Text('$count', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFFF9800),
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Дом"),
          const BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: "Каталог"),
          const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Избранное"),
          const BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "Акции"),
          BottomNavigationBarItem(icon: _cartIconWithBadge(), label: "Корзина"),
          const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
        ],
      ),
    );
  }
}