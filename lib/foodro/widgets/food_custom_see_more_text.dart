import 'package:flutter/material.dart';
import 'package:foodro/foodro/constant/food_colors.dart';

import '../constant/food_strings.dart';

class FoodCustomTextSeeMore extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final ThemeData theme;

  const FoodCustomTextSeeMore(
      {super.key, required this.title, required this.onPressed, required this.theme});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            seeAll,
            style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold, color: foodColorPrimary),
          )
        ],
      ),
    );
  }
}
