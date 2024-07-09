import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:foodro/foodro/app/model/food_category.dart';
import 'package:get/get.dart';

class FoodMoreCategoryController extends GetxController {
  RxList<FoodCategory> allCategories = <FoodCategory>[].obs;

  @override
  void onReady() {
    getCategory();
    super.onReady();
  }

  Future<List<FoodCategory>> getCategory() async {
    String jsonData = await rootBundle.loadString("assets/foodro/data/category.json");
    dynamic data = json.decode(jsonData);
    List<dynamic> jsonArray = data['food_category'];

    for (int i = 0; i < jsonArray.length; i++) {
      allCategories.add(FoodCategory.fromJson(jsonArray[i]));
    }

    return allCategories;
  }


}
