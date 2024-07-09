import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foodro/foodro/app/model/restaurant.dart';
import 'package:get/get.dart';

class FoodRestaurantListController extends GetxController {
  RxList<FoodRestaurant> restaurantList = <FoodRestaurant>[].obs;

  // final Map arguments = Get.arguments ?? {};

  final int id = Get.arguments['id'] ?? 0;
  final String name = Get.arguments['name'] ?? '';

  Future<List<FoodRestaurant>> getRestaurantListByCatId() async {
    restaurantList.clear();
    await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/restaurant_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['restaurant_list'];

    List<FoodRestaurant> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(FoodRestaurant.fromJson(jsonArray[i]));
    }
    for (int j = 0; j < list.length; j++) {
      if (list[j].catId == id) {
        restaurantList.add(list[j]);
      }
    }
    return restaurantList;
  }
}
