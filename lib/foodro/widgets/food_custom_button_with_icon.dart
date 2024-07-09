import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class FoodCustomButtonWithIcon extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onPressed;
  final ThemeData theme;

  const FoodCustomButtonWithIcon(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed, required this.theme});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          // Adjust the border radius as needed
          side: BorderSide(
              color: Get.isDarkMode ? foodBorderDark : foodBorderColor,
              width: 1),
        ),
        elevation: 0,
        padding: const EdgeInsets.all(20),
        backgroundColor: Get.isDarkMode ? foodCardDark : Colors.white,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 24,
            height: 24,
          ),
          10.width,
          Text(text,
              style: theme
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w600))
        ],
      ),
    );
  }
}
