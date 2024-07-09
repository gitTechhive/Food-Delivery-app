import 'package:flutter/material.dart';
import 'package:foodro/foodro/constant/food_colors.dart';
import 'package:foodro/foodro/app/model/food_category.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class RecommendedView extends StatelessWidget {
  final int selectedIndex;
  final int index;
  final VoidCallback onPressed;
  final FoodCategory category;
  final ThemeData theme;
  const RecommendedView(
      {super.key,
      required this.selectedIndex,
      required this.index,
      required this.onPressed,
      required this.category, required this.theme});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap:onPressed ,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: (selectedIndex == index) ? foodColorPrimary : Colors.transparent,
          border: Border.all(color: foodColorPrimary, width: 2),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            commonCacheImageWidget(category.image.toString(), 22, width: 22),
            5.width,
            Text(
              category.name.toString(),
              style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: (selectedIndex == index)
                      ? Colors.white
                      : Get.isDarkMode
                          ? Colors.white
                          : foodTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
