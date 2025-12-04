import 'package:flutter/material.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Скоро здесь появятся акции 🔥',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
