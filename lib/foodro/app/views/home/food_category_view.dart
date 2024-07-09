import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/model/food_category.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';


import '../../../food_theme/food_theme.dart';
import '../../../widgets/food_app_widget.dart';

class CategoryViewScreenState extends StatefulWidget {
  final FoodCategory category;
  final VoidCallback onPressed;

  const CategoryViewScreenState(
      {super.key, required this.category, required this.onPressed});

  @override
  CategoryViewState createState() => CategoryViewState();
}

class CategoryViewState extends State<CategoryViewScreenState> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  double iconSize = 45;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: widget.onPressed,
          child: SizedBox(
            // color: Colors.white,
            width: iconSize,
            height: iconSize,
            child: commonCacheImageWidget(
              widget.category.image.toString(), iconSize,
              width: iconSize,
              // Adjust the width as needed, // Adjust the height as needed
              // fit: BoxFit.cover,
            ),
          ),
        ),
        8.height,
        Text(
          widget.category.name.toString(),
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ).center()
      ],
    );
  }
}
