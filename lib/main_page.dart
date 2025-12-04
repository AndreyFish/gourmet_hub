import 'package:flutter/material.dart';
import 'features/home/view/home_page.dart';
import 'features/catalog/view/catalog_screen.dart';
import 'features/favorites/view/favorites_screen.dart';
import 'features/offers/view/offers_screen.dart';
import 'features/deals/view/deals_screen.dart';
import 'features/profile/view/profile_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0;

  final screens = [
    HomePage(),   // ← ИСПРАВЛЕНО
    CatalogScreen(),
    FavoritesScreen(),
    OffersScreen(),
    DealsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Дом"),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: "Каталог"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Избранное"),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: "Акции"),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Дилы"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Профиль"),
        ],
      ),
    );
  }
}
