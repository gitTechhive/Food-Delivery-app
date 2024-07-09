import 'package:flutter/material.dart';
import 'package:foodro/foodro/app/controller/food_restaurant_list_controller.dart';
import 'package:foodro/foodro/constant/food_images.dart';
import 'package:foodro/foodro/widgets/food_app_widget.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../../route/my_route.dart';
import '../../../../constant/food_colors.dart';
import '../../../../constant/food_strings.dart';
import '../../../../food_theme/food_theme.dart';
import '../../../model/restaurant.dart';
import '../../filter/food_filter_bottom_sheet.dart';
import '../food_restaurant_list_view.dart';
import 'food_sort_filter_view.dart';

class FoodRestaurantListScreen extends StatefulWidget {
  const FoodRestaurantListScreen({super.key});

  @override
  FoodRestaurantListScreenState createState() =>
      FoodRestaurantListScreenState();
}

class FoodRestaurantListScreenState extends State<FoodRestaurantListScreen> {
  late FoodRestaurantListController controller;
  late ThemeData theme;
  @override
  void initState() {
    super.initState();
    controller = Get.put(FoodRestaurantListController());
    theme = Get.isDarkMode ? FoodTheme.foodDarkTheme : FoodTheme.foodLightTheme;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FoodRestaurantListController>(
        init: controller,
        tag: 'food_rest_list',
        // theme: theme,
        builder: (controller) {
          return Scaffold(
              backgroundColor: theme.scaffoldBackgroundColor,
              appBar: fdCommonAppBarWidget(context, titleText: controller.name),
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HorizontalList(
                      itemCount: 1,
                      padding:
                          const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FoodSortFilterView(
                                name: filter,
                                iconName: filterIcon,
                                isIcon: true,
                                onPressed: () {
                                  showModalBottomSheet(
                                    useSafeArea: true,
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SizedBox(
                                        height: MediaQuery.of(context).size.height ,
                                        child: const FoodFilterBottomSheet());
                                    },
                                  );
                                }, theme: theme,),
                            10.width,
                            FoodSortFilterView(
                                name: sort,
                                iconName: sortIcon,
                                isIcon: true,
                                onPressed: () {}, theme: theme,),
                            10.width,
                            FoodSortFilterView(
                                name: promo,
                                iconName: '',
                                isIcon: false,
                                onPressed: () {}, theme: theme,),
                            10.width,
                            FoodSortFilterView(
                                name: selfPickup,
                                iconName: '',
                                isIcon: false,
                                onPressed: () {}, theme: theme,),
                            10.width,
                          ],
                        );
                      },
                    ),
                    _buildRestaurantList()
                  ],
                ),
              ));
        });
  }

  _buildRestaurantList() {
    return Center(
        child: FutureBuilder<List<FoodRestaurant>>(
      future: controller.getRestaurantListByCatId(),
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
                        onPressed: () { Get.toNamed(MyRoute.foodRestaurantDetail);},
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
