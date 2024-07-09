import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/controller/food_favorite_restaurant.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';

import '../../../../../route/my_route.dart';
import '../../../constant/food_colors.dart';
import '../../../constant/food_strings.dart';
import '../../../food_theme/food_theme.dart';
import '../../model/restaurant.dart';
import '../home/food_restaurant_list_view.dart';

class FoodMyFavRestaurantScreen extends StatefulWidget {
  const FoodMyFavRestaurantScreen({super.key});

  @override
  FoodMyFavRestaurantScreenState createState() => FoodMyFavRestaurantScreenState();
}

class FoodMyFavRestaurantScreenState extends State<FoodMyFavRestaurantScreen> {
  late FoodFavRestaurantController controller=Get.put(FoodFavRestaurantController());
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: fdCommonAppBarWidget(context,titleText: myFavoriteRestaurants),
      body: SafeArea(
        child:_buildRestaurantList() ,
      ),
    );
  }

  _buildRestaurantList() {
    return Center(
        child: FutureBuilder<List<FoodRestaurant>>(
          future: controller.getRestaurantList(),
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
                  physics: const AlwaysScrollableScrollPhysics(),
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
                      restaurant: restaurant, theme: theme,
                    );
                  },
                ),
              );
            }
          },
        ));
  }
}