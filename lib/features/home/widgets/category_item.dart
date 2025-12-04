import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String iconPath;

  const CategoryItem({
    super.key,
    required this.title,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.categoryBg,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset(
            iconPath,
            width: 40,
            height: 40,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
