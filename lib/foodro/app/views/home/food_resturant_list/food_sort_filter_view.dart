import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../constant/food_colors.dart';

class FoodSortFilterView extends StatelessWidget{
  final String name;
  final String iconName;
  final Color? iconColor;
  final bool isIcon;
  final VoidCallback onPressed;
  final ThemeData theme;
  const FoodSortFilterView({super.key, required this.name, required this.iconName, required this.isIcon, required this.onPressed, this.iconColor, required this.theme});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: foodColorPrimary, width: 2),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: (isIcon)
            ? Row(
          children: [
            SvgPicture.asset(iconName, height: 12, width: 12,
              colorFilter: ColorFilter.mode(iconColor ?? foodColorPrimary, BlendMode.srcIn) ,),
            5.width,
            Text(
              name,
              style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600, color: foodColorPrimary),
            ),
          ],
        )
            : Text(
          name,
          style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600, color: foodColorPrimary),
        ),
      ),
    );
  }

}