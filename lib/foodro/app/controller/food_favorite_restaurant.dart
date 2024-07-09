import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foodro/foodro/app/model/restaurant.dart';
import 'package:get/get.dart';

class FoodFavRestaurantController extends GetxController {
  RxList<FoodRestaurant> restaurantList = <FoodRestaurant>[].obs;

  Future<List<FoodRestaurant>> getRestaurantList() async {
    restaurantList.clear();
    await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/restaurant_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['restaurant_list'];

    for (int i = 0; i < jsonArray.length; i++) {
      jsonArray[i]['isFavorite'] = true;
      restaurantList.add(FoodRestaurant.fromJson(jsonArray[i]));
    }

    return restaurantList;
  }
}
