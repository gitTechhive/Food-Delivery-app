import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foodro/foodro/app/model/food_category.dart';
import 'package:foodro/foodro/app/model/restaurant.dart';
import 'package:get/get.dart';

class FoodRecommendedController extends GetxController {
  RxList<FoodCategory> recommendedList = <FoodCategory>[].obs;

  RxList<FoodRestaurant> restaurantList = <FoodRestaurant>[].obs;

  RxInt selectedIndex = 0.obs;

  @override
  void onReady() {
    getRecommendedList();
    super.onReady();
  }

  Future<List<FoodCategory>> getRecommendedList() async {
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/category.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['food_category'];

    recommendedList.add(FoodCategory(
        id: 999, name: 'All', image: 'https://i.ibb.co/MB4nxNb/Chips.png'));

    for (int i = 0; i < jsonArray.length; i++) {
      recommendedList.add(FoodCategory.fromJson(jsonArray[i]));
    }

    return recommendedList;
  }

  void toggleSelection(int index) {
    selectedIndex.value = index;
    getRestaurantListByCatId(recommendedList[selectedIndex.value].id);
  }

  Future<List<FoodRestaurant>> getRestaurantListByCatId(int? catId) async {
    restaurantList.clear();
    // await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/restaurant_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['restaurant_list'];

    List<FoodRestaurant> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(FoodRestaurant.fromJson(jsonArray[i]));
    }
    if (catId == 999) {
      restaurantList.addAll(list);
    } else {
      for (int j = 0; j < list.length; j++) {
        if (list[j].catId == catId) {
          restaurantList.add(list[j]);
        }
      }
    }

    return restaurantList;
  }
}
