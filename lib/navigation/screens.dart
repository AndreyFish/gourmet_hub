import 'package:flutter/material.dart';

import '../features/home/view/home_screen.dart';
import '../features/catalog/view/catalog_screen.dart';
import '../features/deals/view/deals_screen.dart';
import '../features/favorites/view/favorites_screen.dart';
import '../features/profile/view/profile_screen.dart';

final List<Widget> appScreens = [
  HomeScreen(),
  CatalogScreen(),
  DealsScreen(),
  FavoritesScreen(),
  ProfileScreen(),
];
