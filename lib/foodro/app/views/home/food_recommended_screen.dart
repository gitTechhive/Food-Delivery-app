import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/controller/food_recommended_controller.dart';
import 'package:foodro/foodro/app/model/food_category.dart';
import '../../../../route/my_route.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../constant/food_colors.dart';
import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';
import '../../../widgets/food_app_widget.dart';
import '../../model/restaurant.dart';
import 'food_recommened_view.dart';
import 'food_restaurant_list_view.dart';

class FoodRecommendedScreen extends StatefulWidget {
  const FoodRecommendedScreen({super.key});

  @override
  FoodRecommendedScreenState createState() => FoodRecommendedScreenState();
}

class FoodRecommendedScreenState extends State<FoodRecommendedScreen> {
  FoodRecommendedController controller = Get.put(FoodRecommendedController());

  late ThemeData theme;

  @override
  void initState() {
    super.initState();

    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodRecommendedController>(
        init: controller,
        tag: 'food_recommended',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
              backgroundColor: theme.scaffoldBackgroundColor,
              appBar:
                  fdCommonAppBarWidget(context, titleText: recommendedForYou),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildRecommendedList(),
                    _buildRestaurantList(),
                  ],
                ),
              ));
        });
  }

  _buildRecommendedList() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
        child: HorizontalList(
          padding: EdgeInsets.zero,
          itemCount: controller.recommendedList.length,
          itemBuilder: (context, index) {
            FoodCategory foodCategory = controller.recommendedList[index];
            return Obx(
              () => RecommendedView(
                selectedIndex: controller.selectedIndex.value,
                index: index,
                onPressed: () {
                  controller.toggleSelection(index);
                },
                category: foodCategory,
                theme: theme,
              ),
            );
          },
        ),
      ),
    );
  }

  _buildRestaurantList() {
    return Center(
        child: FutureBuilder<List<FoodRestaurant>>(
      future: controller.getRestaurantListByCatId(
          controller.recommendedList.isEmpty
              ? 999
              : controller.recommendedList[controller.selectedIndex.value].id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(
            color: foodColorPrimary,
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Obx(
            () => controller.restaurantList.isEmpty
                ? const Text(noDataAvailable)
                : ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.restaurantList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      FoodRestaurant restaurant =
                          controller.restaurantList[index];
                      return FoodRestaurantListView(
                        onPressed: () {
                          Get.toNamed(MyRoute.foodRestaurantDetail);
                        },
                        restaurant: restaurant,
                        theme: theme,
                      );
                    },
                  ),
          );
        }
      },
    ));
  }
}
