import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gourmet_hub/providers/cart_provider.dart';
import 'main_page.dart';
import 'theme/app_theme.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const GourmetHubApp(),   // ← оставь своё название приложения точно как было!
    ),
  );
}

class GourmetHubApp extends StatelessWidget {
  const GourmetHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gourmet Hub',
      debugShowCheckedModeBanner: false,
    theme: AppTheme.lightTheme,
     home: const MainPage(),
    );
  }
}
