import 'package:flutter/material.dart';
import 'main_page.dart';
import 'theme/app_theme.dart';
void main() {
  runApp(const GourmetHubApp());
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
