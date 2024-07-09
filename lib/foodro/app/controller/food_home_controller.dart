import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:foodro/foodro/app/model/food_category.dart';
import 'package:foodro/foodro/app/model/restaurant.dart';
import 'package:get/get.dart';

import '../model/special_offer.dart';

class FoodHomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  FocusNode f1 = FocusNode();
  RxList<FoodCategory> allCategories = <FoodCategory>[].obs;
  RxList<FoodCategory> recommendedList = <FoodCategory>[].obs;

  RxList<FoodRestaurant> restaurantList = <FoodRestaurant>[].obs;
  RxList<FoodRestaurant> discountedRestaurantList = <FoodRestaurant>[].obs;

  @override
  void onReady() {
    getSpecialoffer();
    getCategory();
    getRecommendedList();
    getDiscountedRestaurantList();
    super.onReady();
  }

  RxInt selectedIndex = 0.obs;

  void toggleSelection(int index) {
    selectedIndex.value = index;
    getRestaurantListByCatId(recommendedList[selectedIndex.value].id);
  }

  RxList<SpecialOffer> offerList = <SpecialOffer>[].obs;

  Future<List<SpecialOffer>> getSpecialoffer() async {
    offerList.clear();
    await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/special_offer_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['special_offer_list'];
    if (jsonArray.isNotEmpty) {
      offerList.add(SpecialOffer.fromJson(jsonArray[0]));
    }
    /*  for (int i = 0; i < jsonArray.length; i++) {

    }*/

    return offerList;
  }

  Future<List<FoodCategory>> getCategory() async {
    String jsonData = await rootBundle
        .loadString("assets/foodro/data/category.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['food_category'];

    if (jsonArray.length > 7) {
      for (int i = 0; i < 7; i++) {
        allCategories.add(FoodCategory.fromJson(jsonArray[i]));
      }
    } else {
      for (int i = 0; i < jsonArray.length; i++) {
        allCategories.add(FoodCategory.fromJson(jsonArray[i]));
      }
    }
    allCategories.add(FoodCategory(
        id: jsonArray.length,
        name: 'more',
        image: 'https://i.ibb.co/1XHMc9p/image.png'));
    return allCategories;
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

  Future<List<FoodRestaurant>> getDiscountedRestaurantList() async {
    discountedRestaurantList.clear();
    await Future.delayed(const Duration(seconds: 1));
    String jsonData = await rootBundle.loadString(
        "assets/foodro/data/discounted_restaurant_list.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['restaurant_list'];
    for (int i = 0; i < jsonArray.length; i++) {
      discountedRestaurantList.add(FoodRestaurant.fromJson(jsonArray[i]));
    }

    return discountedRestaurantList;
  }
}
