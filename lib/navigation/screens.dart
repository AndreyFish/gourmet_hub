import 'package:flutter/material.dart';

import '../features/home/view/home_screen.dart';
import '../features/catalog/view/catalog_screen.dart';
import '../features/deals/view/deals_screen.dart';
import '../features/favorites/view/favorites_screen.dart';
import '../features/profile/view/profile_screen.dart';
import '../models/recipe.dart'; // <-- импорт модели Recipe

final List<Widget> appScreens = [
  HomeScreen(recipes: const <Recipe>[]), // <-- передаём строго типизированный пустой список
  CatalogScreen(),
  DealsScreen(),
  FavoritesScreen(),
  ProfileScreen(),
];