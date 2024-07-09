import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/restaurant.dart';

class FoodSearchResultController extends GetxController {
  TextEditingController searchController = TextEditingController();
  FocusNode f1 = FocusNode();

  final String searchText = Get.arguments ?? '';

  RxList<FoodRestaurant> foodRestaurantList = <FoodRestaurant>[].obs;
  RxList<FoodRestaurant> filterRestaurantList = <FoodRestaurant>[].obs;

  Future<List<FoodRestaurant>> getRestaurantList() async {
    foodRestaurantList.clear();
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/restaurant_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['restaurant_list'];

    List<FoodRestaurant> list = [];
    for (int i = 0; i < jsonArray.length; i++) {
      list.add(FoodRestaurant.fromJson(jsonArray[i]));
    }
    for (int j = 0; j < list.length; j++) {
      foodRestaurantList.add(list[j]);
    }
    filterSearchResults(searchText);

    return foodRestaurantList;
  }

  Future<List<FoodRestaurant>> filterSearchResults(String query) async {
    filterRestaurantList.clear();
    if (query.isNotEmpty) {
      List<FoodRestaurant> dummyList = [];
      for (var item in foodRestaurantList) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyList.add(item);
        }
      }
      filterRestaurantList.addAll(dummyList);
    } else {
      filterRestaurantList.addAll(foodRestaurantList);
    }
    return filterRestaurantList;
  }

  @override
  void onInit() {
    super.onInit();
    searchController.text = searchText;
    getRestaurantList();
  }
}
