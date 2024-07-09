import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foodro/foodro/app/model/restaurant.dart';
import 'package:get/get.dart';

class FoodRestaurantDetailController extends GetxController {
  var foodRestaurant = FoodRestaurant().obs;
  RxInt selectedForYouIndex = 999.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    final jsonData = await rootBundle
        .loadString('assets/foodro/data/restaurant_detail.json');
    final jsonMap = json.decode(jsonData);
    foodRestaurant(FoodRestaurant.fromJson(jsonMap));
    // foodRestaurant = FoodRestaurant.fromJson(jsonMap);
  }

  // RxInt quantity = 1.obs;



/* Future<void> fetchData() async {
    final response = await GetConnect()
        .get('assets/foodro/data/restaurant_detail.json');
    if (response.status.hasError) {
      // Handle error
      print('Error fetching data: ${response.statusText}');
    } else {
      // Parse JSON data
      final jsonMap = response.body;
      foodRestaurant(FoodRestaurant.fromJson(jsonMap));
    }
  }*/
}
