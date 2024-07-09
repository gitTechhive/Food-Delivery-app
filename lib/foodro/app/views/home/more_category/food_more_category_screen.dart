import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/controller/food_more_category_controller.dart';
import 'package:foodro/foodro/app/model/food_category.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';

import '../../../../../../route/my_route.dart';
import '../../../../constant/food_strings.dart';
import '../../../../food_theme/food_theme.dart';
import '../food_category_view.dart';

class FoodMoreCategoryScreen extends StatefulWidget {
  const FoodMoreCategoryScreen({super.key});

  @override
  FoodMoreCategoryScreenState createState() => FoodMoreCategoryScreenState();
}

class FoodMoreCategoryScreenState extends State<FoodMoreCategoryScreen> {
  late FoodMoreCategoryController controller;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    controller = Get.put(FoodMoreCategoryController());
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodMoreCategoryController>(
        init: controller,
        tag: 'food_more_cat',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
            backgroundColor: theme.scaffoldBackgroundColor,
            appBar: fdCommonAppBarWidget(context, titleText: moreCategory),
            body: _buildCategoryList(),
          );
        });
  }

  _buildCategoryList() {
    return Obx(
      () => Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          // height: 110,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: controller.allCategories.length,
            itemBuilder: (ctx, i) {
              FoodCategory cat = controller.allCategories[i];
              return CategoryViewScreenState(
                category: cat,
                onPressed: () {
                  Get.toNamed(MyRoute.foodRestaurantList,
                      arguments: {'id': cat.id, 'name': cat.name});
                },
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                mainAxisExtent: 100),
          )),
    );
  }
}
